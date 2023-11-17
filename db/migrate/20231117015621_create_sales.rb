class CreateSales < ActiveRecord::Migration[6.1]
  def change
    create_table :sales do |t|
      t.string :name
      t.string :percent_off
      t.string :starts_on
      t.string :ends_on

      t.timestamps
    end
  end
end
