class People < ActiveRecord::Migration
  def change
    add_column :people, :email, :string, :unique => true
  end
end
