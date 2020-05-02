def gen_rand_str(
        length, 
        options={
            numbers: false,
            include_spaces: false
        }
    )
    prng = Random.new
    result = ''
    rng = nil
    if options[:numbers] then
        rng = ('0'..'9').to_a
    else
        rng = ('A'..'Z').to_a.concat(('a'..'z').to_a)
    end
    options[:include_spaces] && (rng << ' ')
    
    length.times do
        result += rng[prng.rand(rng.length)].to_s
    end
    
    return result
end

FactoryBot.define do
    
    prng = Random.new
    
    factory :exchange do
        sequence(:id) { | n | n } 
        symbol { gen_rand_str(3) }
        name { gen_rand_str(9, include_spaces: true) }
        region { gen_rand_str(2) }
        mic { ' '+gen_rand_str(6) }
        exchange_suffix { '-'+gen_rand_str(4) }
        factory :exchange_with_indices_with_stocks do
            transient do
                indices_count { 5 }
            end
            after(:create) do |exchange, evaluator|
                create_list(:index_with_stocks, evaluator.indices_count, exchange: exchange)
            end
        end
    end
    
    factory :index do
        sequence(:id) { | n | n } 
        symbol { gen_rand_str(4) }
        name { 
            gen_rand_str(4)+" "+gen_rand_str(3, numbers: true)
        }
        latest_price { 
            prng.rand(1000.0..10000.0).round(2) 
        }
        exchange
        factory :index_with_stocks do
            transient do
                stocks_count { 5 }
            end
            after(:create) do |index, evaluator|
                create_list(:stock, evaluator.stocks_count, indices: [index])
            end
        end
    end
    
    factory :stock do
        sequence(:id) { | n | n } 
        symbol { gen_rand_str(4) }
        name { gen_rand_str(32, include_spaces: true) }
        latest_price { 
            prng.rand(0.5..300.0).round(2) 
            }
        exchange
        factory :stock_with_indices do
            transient do
                indices_count { 5 }
            end
            after(:create) do |stock, evaluator|
                create_list(:index, evaluator.indices_count, stocks: [stock])
            end
        end
    end
    
end