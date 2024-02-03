require 'csv'

class Crypto::CsvExportsController < ApplicationController
  def show_results
    @calculated_value = calculated_value_params[:calculated_value]
  end

  def create
    @calculated_value = calculated_value_params[:calculated_value]
    if @calculated_value.present?
      csv = CsvGeneratorService.new(@calculated_value)
      csv_exported = csv.generate

      respond_to do |format|
        format.csv do
          send_data csv_exported,
                    filename: "investment_results_#{Time.now.strftime('%Y/%m/%d-%H:%M')}.csv",
                    type: 'text/csv',
                    disposition: 'attachment'
        end

        format.json do
          render json: { calculated_value: @calculated_value }
        end
      end
      
    else
      flash[:error] = 'No hay resultados disponibles.'
      redirect_to crypto_show_results_path
    end
  end

  private 

  def calculated_value_params
    params.permit(:format, calculated_value: [:currency, :monthly_rate, :initial_balance, :final_projected_balance, :price_usd, :crypto_uds, :crypto_profit])
  end
end
