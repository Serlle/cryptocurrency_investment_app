require "test_helper"

module Crypto
  class LiveControllerTest < ActionDispatch::IntegrationTest
    def setup
      @api_key = '761BFA6C-3951-44B2-9F69-24A0E6DD7414'  # Reemplaza con la clave de API real para las pruebas
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