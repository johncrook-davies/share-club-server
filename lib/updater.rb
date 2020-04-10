class Updater
    public
        def initialize(hash)
            @model_obj = hash[:for]
            @frequency = hash[:every] || 5
            @command = :go
            continuously_update
        end
        def stop
            @command = :stop
        end
    private
        def continuously_update
            Thread.new { 
                loop do
                    if @command === :go
                        @model_obj.get_latest_info()
                        sleep @frequency
                    elsif @command === :stop
                        break
                    end
                end
            }
        end  
end