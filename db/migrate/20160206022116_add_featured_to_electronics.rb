class AddFeaturedToElectronics < ActiveRecord::Migration
  def change
    add_column :electronics, :featured, :boolean, default: false
  end
end
