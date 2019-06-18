class AddEventSubTitle < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :sub_title, :string
  end
end
