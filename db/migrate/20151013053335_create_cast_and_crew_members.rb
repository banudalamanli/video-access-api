class CreateCastAndCrewMembers < ActiveRecord::Migration
  def change
    create_table :cast_and_crew_members do |t|
      t.belongs_to :video, index: true, foreign_key: true
      t.belongs_to :person_with_role, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
