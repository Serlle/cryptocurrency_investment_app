require "test_helper"

module Crypto
  class LiveControllerTest < ActionDispatch::IntegrationTest
    def setup
      @api_key =  ENV['COINAPI_KEY']
      @coinapi_service = CoinapiService.new(@api_key)
    end

    test "should get index" do
      get crypto_live_index_path
      assert_response :success
    end

    test "should get cryptos data with status 200" do
      get crypto_live_index_path
      @cryptos = @coinapi_service.get_value_from('USD')
      assert_equal 200, @cryptos[:status]
    end
  end
end