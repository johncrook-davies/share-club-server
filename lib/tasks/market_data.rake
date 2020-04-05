namespace :market_data do
    
    desc "Get updated indices"
    task :index, [:name] => :environment do |t, args|
        name = args[:name]
        Exchange.find_by(symbol: name).get_stock_list
    end
    
end