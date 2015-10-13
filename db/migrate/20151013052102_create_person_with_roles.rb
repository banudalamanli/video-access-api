class CreatePersonWithRoles < ActiveRecord::Migration
  def change
    create_table :person_with_roles do |t|
      t.belongs_to :person, index: true, foreign_key: true
      t.belongs_to :role, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
