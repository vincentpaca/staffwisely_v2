class ConvertIntToFloatInProposals < ActiveRecord::Migration
  def up
    change_column :proposals, :hourly_rate, :decimal, precision: 20, scale: 2
    change_column :proposals, :monthly_rate, :decimal, precision: 20, scale: 2
  end

  def down
    change_column :proposals, :hourly_rate, :integer
    change_column :proposals, :monthly_rate, :integer
  end
end
