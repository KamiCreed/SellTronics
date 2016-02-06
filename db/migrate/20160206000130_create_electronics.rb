class CreateElectronics < ActiveRecord::Migration
  def change
    create_table :electronics do |t|
      t.string :name
      t.text :desc

      t.timestamps
    end
  end
end
