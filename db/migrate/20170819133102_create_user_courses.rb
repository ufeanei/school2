class CreateUserCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :user_courses do |t|
    	t.integer :user_id, :course_id
    	t.timestamps
    end
  end
end
