class AddCurrenciesToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :monthly_currency, :integer
    add_column :proposals, :hourly_currency, :integer
  end
end
