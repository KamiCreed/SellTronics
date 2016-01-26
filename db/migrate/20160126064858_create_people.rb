class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.float :weight
      t.float :height
      t.string :color

      t.timestamps
    end
  end
end
