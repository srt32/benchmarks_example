class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.integer :amount
      t.references :campaign, index: true

      t.timestamps
    end
  end
end
