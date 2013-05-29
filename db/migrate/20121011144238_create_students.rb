require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateStudents < ActiveRecord::Migration
  def up
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date   :birthday, :null => false
      t.string :email, :null => false, :unique => true
      t.string :phone, :null => false
    end

    # HINT: checkout ActiveRecord::Migration.create_table
  end

  def down
    drop_table :students
  end
end
