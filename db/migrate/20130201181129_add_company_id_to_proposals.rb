class AddCompanyIdToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :company_id, :integer
  end
end
