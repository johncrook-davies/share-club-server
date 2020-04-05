namespace :scheduler do
    
    desc "Get updated indices"
    task :index, [:name, :limit] => :environment do |t, args|
        name = args[:name]
        limit = args[:limit] || false
        Exchange.find_by(symbol: name).get_stock_list(limit: false)
    end
    
    desc "Updated prices"
    task :update => :environment do
        Stock.get_latest_info_all
    end
    
end