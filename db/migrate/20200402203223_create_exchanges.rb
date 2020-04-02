class CreateExchanges < ActiveRecord::Migration[6.0]
    def change
        create_table :exchanges do |t|
            t.string :symbol
            t.string :name
            t.string :region
            t.string :mic
            t.string :exchange_suffix
            t.timestamps
        end
    end
end
