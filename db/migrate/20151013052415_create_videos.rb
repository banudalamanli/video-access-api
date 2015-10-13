class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title, null:false
      t.text :desc, null:false

      t.timestamps null: false
    end
  end
end
