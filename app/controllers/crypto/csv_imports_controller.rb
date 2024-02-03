class Crypto::CsvImportsController < ApplicationController
  def new
  end

  def create
    uploaded_file = csv_file_params[:csv_file]
    if uploaded_file.present? && uploaded_file.content_type == "text/csv"
      csv_data = CsvReaderService.new(uploaded_file.path).read
      investment = InvestmentCalculatorService.new(csv_data)
      calculated_value = investment.calculate

      flash[:success] = 'Archivo CSV importado y calculo hecho exitosamente.'
      redirect_to crypto_show_results_path(calculated_value: calculated_value)
    else
      flash[:error] = 'Por favor, selecciona un archivo CSV válido.'
      redire_to new_crypto_csv_import_path
    end
  end

  private

  def csv_file_params
    params.permit(:csv_file, :authenticity_token, :commit)
  end
end
