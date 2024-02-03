class CsvGeneratorService
  require 'csv'

  def initialize(calculated_value)
    @calculated_value = calculated_value
  end

  def generate
    CSV.generate(headers: true) do |csv|
      csv << ['Moneda', 'Interés Mensual', 'Balance Inicial', 'Balance Proyectado Final(USD)']
      @calculated_value.each do |data|
        csv << [
          data[:currency],
          data[:monthly_rate],
          data[:initial_balance],
          data[:final_projected_balance]
        ]
      end
    end
  end
end
