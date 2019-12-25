class AddHeadhunterRefToJob < ActiveRecord::Migration[5.2]
  def change
    add_reference :jobs, :headhunter, foreign_key: true
  end
end
