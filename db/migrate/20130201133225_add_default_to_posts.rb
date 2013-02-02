class AddDefaultToPosts < ActiveRecord::Migration
  def up
    change_column :posts, :draft, :boolean, :default => false
  end

  def down
    change_column :posts, :draft, :boolean, :default => nil
  end
end
