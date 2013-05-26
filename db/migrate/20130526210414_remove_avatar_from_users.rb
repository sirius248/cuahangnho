class RemoveAvatarFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :avatar, :string
    remove_column :users, :github, :string
    remove_column :users, :twitter, :string
  end
end
