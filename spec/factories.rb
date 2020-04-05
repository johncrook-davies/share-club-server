FactoryBot.define do
    
    prng = Random.new
    
    factory :exchange do
        sequence(:id) { | n | n } 
        symbol { 'LON' } #('a'..'z').to_a.shuffle.join
        name { 'London index' }
        region { 'gb' }
        mic {' FTSEGB' }
        exchange_suffix { '-LON' }
    end
    
    factory :stock do | u |
        u.sequence(:id) { | n | n } 
        u.symbol { ('A'..'Z').to_a[prng.rand(25)] * 4 }
        u.name { ('A'..'z').to_a[prng.rand(25)] * 32 }
        u.latest_price { 
            prng.rand(0.5..300.0).round(2) 
            }
        u.exchange
    end
    
end