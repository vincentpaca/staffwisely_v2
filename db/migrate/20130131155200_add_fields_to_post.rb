class AddFieldsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :working_arrangement, :integer
    add_column :posts, :experience, :integer
    add_column :posts, :draft, :boolean
    add_column :posts, :user_id, :integer
  end
end
