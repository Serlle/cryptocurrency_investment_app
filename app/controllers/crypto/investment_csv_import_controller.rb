class Crypto::InvestmentCsvImportController < ApplicationController
  def new
  end

  def create
    uploaded_file = csv_file_params[:csv_file]
    if uploaded_file.present? && uploaded_file.content_type == "text/csv"
      csv_data = CsvReaderService.new(uploaded_file.path).read
      calculator = InvestmentCalculatorService.new(csv_data)
      calculated_value = calculator.calculate
      flash[:success] = 'Archivo CSV importado y calculo hecho exitosamente.'
    else
      flash[:error] = 'Por favor, selecciona un archivo CSV válido.'
      redire_to new_crypto_investment_csv_import_path
    end

  end

  private

  def csv_file_params
    params.permit(:csv_file)
  end
end
