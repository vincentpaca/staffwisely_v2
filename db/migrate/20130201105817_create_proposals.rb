class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.integer :user_id
      t.integer :post_id
      t.integer :hourly_rate
      t.integer :monthly_rate
      t.text :details
      t.integer :currency

      t.timestamps
    end
  end
end
