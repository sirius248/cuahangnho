class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :address, :string
    add_column :users, :description, :text
    add_column :users, :phone, :integer
    add_column :users, :facebook, :string
    add_column :users, :owner, :string
  end
end
