class Crypto::CsvExportsController < ApplicationController
  def show_results
    @calculated_value = calculated_value_params[:calculated_value]
  end

  def create
  end

  private 

  def calculated_value_params
    params.permit(calculated_value: [:currency, :monthly_rate, :initial_balance, :final_projected_balance])
  end
end
