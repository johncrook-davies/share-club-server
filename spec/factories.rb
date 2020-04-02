FactoryBot.define do
    
    prng = Random.new
    
    factory :exchange do
        sequence(:id) { | n | n } 
        symbol { 'FTSE' } #('a'..'z').to_a.shuffle.join
        name { 'London index' }
        region { 'gb' }
        mic {' FTSEGB' }
        exchange_suffix { '-LON' }
    end
    
    factory :stock do
        sequence(:id) { | n | n } 
        symbol { 'AAPL' }
        name { 'London index' }
        latest_price { 
            prng.rand(0.5..300.0).round(2) 
            }
        exchange
    end
    
end