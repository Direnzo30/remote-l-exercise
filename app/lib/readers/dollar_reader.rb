require_relative './base_reader.rb'
class DollarReader < BaseReader
  def initialize(file_content)
    super('$', '%d-%m-%Y', file_content)
  end
end