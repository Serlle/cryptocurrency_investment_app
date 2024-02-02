class CoinapiService
  COINAPI_BASE_URL = 'https://rest.coinapi.io/v1/exchangerate/'.freeze

  def initialize(api_key)
    @api_key = api_key    
  end

  def get_value_from(currency)
    endpoint = "#{currency}"
    params = { filter_asset_id: "BTC,ETH,ADA" }
    make_request(endpoint, params)
  end

  private

  def make_request(endpoint, params)
    @conn ||= Faraday.new(COINAPI_BASE_URL) do |f|
      f.adapter Faraday.default_adapter
      f.headers['X-CoinAPI-Key'] = @api_key
      f.request :json # encode req bodies as JSON
      f.response :json # decode response bodies as JSON
    end

    request = @conn.get(endpoint, params)
    return { status: request.status, data: request.body["rates"] }
  end
end