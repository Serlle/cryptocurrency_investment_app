class InvestmentCalculatorService
  def initialize(csv_data)
    @csv_data = csv_data
  end

  def calculate
    results = []

    @csv_data.each do |row| 
      balance_ini = row[:balance_ini].to_f
      monthly_rate = row[:interes_mensual].to_f / 100 
      years = 1
      final_projected_balance = balance_ini * (1 + (monthly_rate*12)/12)**(12*years)

      results << {
        currency: row[:moneda],
        monthly_rate: row[:interes_mensual],
        initial_balance: balance_ini,
        final_projected_balance: final_projected_balance.round(2)
      }
    end

    results
  end
end