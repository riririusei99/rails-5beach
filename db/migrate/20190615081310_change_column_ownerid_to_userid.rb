class ChangeColumnOwneridToUserid < ActiveRecord::Migration[5.2]
  def change
    rename_column :events, :owner_id, :user_id
  end
end
