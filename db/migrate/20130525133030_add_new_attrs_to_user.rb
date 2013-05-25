class AddNewAttrsToUser < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :string
    add_column :users, :twitter, :string
    add_column :users, :github, :string
  end
end
