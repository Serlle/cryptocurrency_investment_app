class InvestmentCalculatorService
  def initialize(csv_data)
    @csv_data = csv_data
  end

  def calculate
    results = []
    cryptos ||= get_value_from_cryptos

    @csv_data.each do |row| 
      balance_ini = row[:balance_ini].to_f
      monthly_rate = row[:interes_mensual].to_f / 100 
      years = 1
      final_projected_balance = balance_ini * (1 + (monthly_rate*12)/12)**(12*years)
      crypto_uds = (1/cryptos[row[:moneda]].to_f).round(2)
      crypto_profit = (cryptos[row[:moneda]].to_f * final_projected_balance.to_f).round(4)

      results << {
        currency: row[:moneda],
        monthly_rate: row[:interes_mensual],
        initial_balance: balance_ini,
        final_projected_balance: final_projected_balance.round(2),
        price_usd: cryptos[row[:moneda]],
        crypto_uds: crypto_uds,
        crypto_profit: crypto_profit
      }
    end
    results
  end

  private

  def get_value_from_cryptos
    api_key = ENV['COINAPI_KEY']
    coinapi_service = CoinapiService.new(api_key)
    @cryptos = coinapi_service.get_value_from('USD')

    {
      "Bitcoin" => "#{@cryptos[:data][1]['rate']}", 
      "Ether" => "#{@cryptos[:data][2]['rate']}", 
      "Cardano" => "#{@cryptos[:data][0]['rate']}"
    }
  end
end