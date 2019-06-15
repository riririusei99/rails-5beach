class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.date        :date
      t.string      :title
      t.text        :text
      t.integer     :owner_id
      t.timestamps
    end
  end
end
