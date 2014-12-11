class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.date :date
      t.decimal :weight

      t.references :user, index: true
      t.timestamps
    end
  end
end
