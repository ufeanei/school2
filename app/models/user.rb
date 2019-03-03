class User < ActiveRecord::Base
  attr_accessor :remember_token, :confirmation_token, :reset_token

  has_many :user_courses, dependent: :destroy
  has_many :courses, through: :user_courses

  before_save :downcase_email
  before_create :create_confirmation_digest
  
  
  
  
  validates :qualification,  presence: { message: "Pls fill your qualification"}
  validates :phone,  presence: { message: "give us your phone number"}
  validates :family_name,  presence: { message: "Family name please"}
  validates :other_names,  presence: { message: "Other names please"}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: { message: "email must be filled"},
                    format: { with: VALID_EMAIL_REGEX, message: ", email invalid" },
                    uniqueness: { case_sensitive: false, message: "email already in use." }

  has_secure_password

  validates :password, presence: {message: "must be filled"}, on: :create, length: { minimum: 6, message: "Password must be at least 6 letters"}, allow_nil: true
  validates :course_ids,  presence: { message: "Select your course"} 
    #used to create the digest of any string
  def self.digest(string) 
    BCrypt::Password.create(string, cost: 8)
  end

  # use this to generate any random url safe base64 token
  def self.new_token
    SecureRandom.urlsafe_base64
  end

  #this method sets a remeber_token then inserts its digest in the remember_column of a user 
  def remember
    self.remember_token = User.new_token  
    update_attribute(:remember_digest, User.digest(remember_token))  
  end

  #this generalised method checks whether the token your provide corresponds to the digest stored. if there is a mismatch it return false
  #the digest.nil? part is crucial for those who sign in many diiferent browsers on the same machine. 
  # imagine user signs out in firefox, close one chrome browser then tries to use the last browser to request unauthorized pages.

  def authenticated?(attribute, token)
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?                        
                                                         
    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  # create and sets a reset_digest, reset_token virtual attribute a
  def create_reset_digest
      self.reset_token = User.new_token
      update_attribute(:reset_digest,  User.digest(reset_token))
      update_attribute(:reset_sent_at, Time.zone.now)
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

 

  private

   # Converts email to all lower-case.
    def downcase_email
       self.email = email.downcase
    end

    # Creates and assigns the activation token and digest.
    def create_confirmation_digest
      self.confirmation_token  = User.new_token
      self.confirmation_digest = User.digest(confirmation_token)
    end

    
end