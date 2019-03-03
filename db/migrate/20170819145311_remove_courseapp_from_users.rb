class RemoveCourseappFromUsers < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :courseapp, :string
  end
end
