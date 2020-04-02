class CreateStocks < ActiveRecord::Migration[6.0]
    def change
        create_table :stocks do |t|
            t.string :symbol
            t.string :name
            t.decimal :latest_price
            t.belongs_to :exchange
            t.timestamps
        end
    end
end
