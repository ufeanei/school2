class AddRelatedPasswordColToUsers < ActiveRecord::Migration[5.1]
  def change
	add_column :users, :remember_digest, :string
	add_column :users, :confirmation_digest, :string
  	add_column :users, :confirmed, :boolean, default: false
  	add_column :users, :activated_at, :datetime
  	add_column :users, :reset_digest, :string
  	add_column :users, :reset_sent_at, :datetime
  end
end
