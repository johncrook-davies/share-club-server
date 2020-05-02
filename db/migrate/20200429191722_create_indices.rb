class CreateIndices < ActiveRecord::Migration[6.0]
    def change
        create_table :indices do |t|
            t.string        :name
            t.string        :symbol
            t.decimal       :latest_price
            t.belongs_to    :exchange
            t.timestamps
        end
        
        create_table :indices_stocks, id: false do |t|
            t.belongs_to    :index
            t.belongs_to    :stock
        end
    end
end
