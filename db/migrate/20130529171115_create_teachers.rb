require_relative '../config'

class CreateTeachers < ActiveRecord::Migration
  def up
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, :unique => true
      t.string :address
      t.string :phone
    end
  end

  def down
    drop_table :teachers
  end

end
