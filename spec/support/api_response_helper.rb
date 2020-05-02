module ApiResponseHelper
    
    def returned_get_stocks
        return [
            {"symbol"=>"XDEM-LN", "exchange"=>"ONL", "name"=>"onE FdmrtCCIXMUtamWTor kTSMI clS seure ", "date"=>"2020-04-04", "type"=>"et", "iexId"=>"IEX_5832325236312D52", "region"=>"GB", "currency"=>"GBP", "isEnabled"=>true, "figi"=>"S7BRG0B63F70", "cik"=>nil},{"symbol"=>"XDEQ-LN", "exchange"=>"ONL", "name"=>"  IerClTuU TsrXylttWr QaMakIocSSFiCE d", "date"=>"2020-04-04", "type"=>"et", "iexId"=>"IEX_423530465A442D52", "region"=>"GB", "currency"=>"GBP", "isEnabled"=>true, "figi"=>"S4PBGB750407", "cik"=>nil},
            {"symbol"=>"XDER-LN", "exchange"=>"LON", "name"=>"iELR AtacU1iOE iTATDPEa T nPLE)ETCEEelIDVFaE/psX NRERUIRsk CEE FRA  StStPTa rrDSoAOC (TE", "date"=>"2020-04-04", "type"=>"et", "iexId"=>"IEX_50385A484C342D52", "region"=>"GB", "currency"=>"GBP", "isEnabled"=>true, "figi"=>"00M040GQW7BB", "cik"=>nil},
            {"symbol"=>"XDEV-LN", "exchange"=>"LON", "name"=>" TkTI c CoSrXeU SIsCarWta EllVduMrFe", "date"=>"2020-04-04", "type"=>"et", "iexId"=>"IEX_4252354D31582D52", "region"=>"GB", "currency"=>"GBP", "isEnabled"=>true, "figi"=>"QG6772BS0B0M", "cik"=>nil},
            {"symbol"=>"XDEW-LN", "exchange"=>"OLN", "name"=>"al I Ti &t0eWqtEXe5rFag0Uu Sc ETSPs hkCr", "date"=>"2020-04-04", "type"=>"et", "iexId"=>"IEX_5156533736392D52", "region"=>"GB", "currency"=>"USD", "isEnabled"=>true, "figi"=>"0Z0BG0DBDN6B", "cik"=>nil},
            {"symbol"=>"XDEX-LN", "exchange"=>"LON", "name"=>"KW UsFtrx-laEUA rES Sere CcTT Fll koIXTd", "date"=>"2020-04-04", "type"=>"et", "iexId"=>"IEX_584E4D5732532D52", "region"=>"GB", "currency"=>"GBP", "isEnabled"=>true, "figi"=>"98X0NBBBHMG0", "cik"=>nil},
            {"symbol"=>"XDGU-LN", "exchange"=>"NLO", "name"=>"Xtr aS odoTBSeEUI krcrnUDs Fp CeatoTrC", "date"=>"2020-04-04", "type"=>"et", "iexId"=>"IEX_475238384E312D52", "region"=>"GB", "currency"=>"USD", "isEnabled"=>true, "figi"=>"7B50BG05C7B7", "cik"=>nil}
        ].to_json
    end
    
    def returned_get_info_for
        return {"symbol"=>"AAPL", "companyName"=>"Apple, Inc.", "primaryExchange"=>"ADASQN", "calculationPrice"=>"close", "open"=>254.6, "openTime"=>1628354947613, "openSource"=>"ilcfioaf", "close"=>247.8, "closeTime"=>1635367428478, "closeSource"=>"fifiocla", "high"=>250.1, "highTime"=>1596444383192, "highSource"=>"aderpyi ime leeucn5 dt1", "low"=>241.318, "lowTime"=>1622485606677, "lowSource"=>"tc ar uei ddeyn5peeli1m", "latestPrice"=>252.56, "latestSource"=>"Close", "latestTime"=>"April 3, 2020", "latestUpdate"=>1599939147155, "latestVolume"=>32920518, "iexRealtimePrice"=>nil, "iexRealtimeSize"=>nil, "iexLastUpdated"=>nil, "delayedPrice"=>252.53, "delayedPriceTime"=>1605968670781, "oddLotDelayedPrice"=>245.33, "oddLotDelayedPriceTime"=>1643772220943, "extendedPrice"=>252.74, "extendedChange"=>-0.32, "extendedChangePercent"=>-0.00134, "extendedPriceTime"=>1649779050501, "previousClose"=>248.09, "previousVolume"=>43409401, "change"=>-3.62, "changePercent"=>-0.01444, "volume"=>32483424, "iexMarketPercent"=>nil, "iexVolume"=>nil, "avgTotalVolume"=>70901922, "iexBidPrice"=>nil, "iexBidSize"=>nil, "iexAskPrice"=>nil, "iexAskSize"=>nil, "iexOpen"=>nil, "iexOpenTime"=>nil, "iexClose"=>249.51, "iexCloseTime"=>1612208589229, "marketCap"=>1088632673523, "peRatio"=>19.2, "week52High"=>332.32, "week52Low"=>173.54, "ytdChange"=>-0.2003038384816149, "lastTradeTime"=>1621398128721, "isUSMarketOpen"=>false}.to_json
    end
    
    def returned_get_index_price
        return {
            latest_price: "5763.1001"
        }
    end
end