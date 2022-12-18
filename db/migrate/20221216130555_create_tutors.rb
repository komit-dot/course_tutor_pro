class CreateTutors < ActiveRecord::Migration[7.0]
  def change
    create_table :tutors do |t|
      t.string :full_name
      t.integer :course_id
      t.string :address
      t.integer :mobile_no
      t.string :email

      t.timestamps
    end
  end
end
