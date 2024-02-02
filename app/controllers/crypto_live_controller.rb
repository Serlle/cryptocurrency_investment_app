class CryptoLiveController < ApplicationController
  def index
    api_key = '761BFA6C-3951-44B2-9F69-24A0E6DD7414' 
    coinapi_service = CoinapiService.new(api_key)
    @cryptos = coinapi_service.get_value_from('USD')
    @ada = @cryptos[:data][0]
    @btc = @cryptos[:data][1]
    @eth = @cryptos[:data][2]
  end
end
