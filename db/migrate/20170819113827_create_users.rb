class CreateUsers < ActiveRecord::Migration[5.1]

  def change
    create_table :users do |t|
      t.string :family_name
      t.string :other_names
      t.string :email
      t.string :password_digest
      t.string :courseapp
      t.boolean :admin, default: false
      t.boolean :registered, default: false
      t.string :phone
      t.string :qualification
      t.string :nationality
      t.timestamps
    end
  end

end


