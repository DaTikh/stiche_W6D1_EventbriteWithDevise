class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.date :date
      t.time :time
      t.string :place
      t.belongs_to :creator
      
      t.timestamps
    end
  end
end
