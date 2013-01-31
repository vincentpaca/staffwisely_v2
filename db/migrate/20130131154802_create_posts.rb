class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.text :requirements
      t.text :contact_details

      t.timestamps
    end
  end
end
