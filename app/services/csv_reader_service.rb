require 'csv'

class CsvReaderService
  def initialize(file_path)
    @file_path = file_path
  end

  def read
    csv_data = CSV.read(@file_path, headers: true, header_converters: :symbol)
    csv_data.map { |row| row.to_h }
  end
end