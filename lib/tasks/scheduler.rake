namespace :scheduler do
    
    desc "Get updated indices"
    task :index, [:name] => :environment do |t, args|
        name = args[:name]
        Exchange.find_by(symbol: name).get_stock_list
    end
    
    desc "Updated prices"
    task :update => :environment do
        Stock.get_latest_info_all
    end
    
end