module Crypto
  class LiveController < ApplicationController
    def index
      api_key = ENV['COINAPI_KEY']
      coinapi_service = CoinapiService.new(api_key)
      @cryptos = coinapi_service.get_value_from('USD')
      @ada = @cryptos[:data][0]
      @btc = @cryptos[:data][1]
      @eth = @cryptos[:data][2]
    end
  end
end