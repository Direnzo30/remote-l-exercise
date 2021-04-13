require_relative '../../models/person.rb'
require_relative '../../constants/reader_constants.rb'
require 'date'
class BaseReader

  include ReaderConstants

  def initialize(symbol, date_format, file_content)
    @symbol = symbol
    @date_format = date_format
    @file_content = file_content || []
    @headers = file_headers
  end

  def retrieve_persons
    entries = []
    return entries if @file_content.size <= 1

    @file_content[1..].each do |line|
      entries << person_from_line(line)
    end
    entries
  end

  private

  def file_headers
    headers = {}
    @file_content.first&.split(@symbol)&.each_with_index do |header, index|
      headers[header.strip.downcase.to_sym] = index
    end
    headers
  end

  def person_from_line(line)
    content = line.split(@symbol)
    person_params = {}
    POSSIBLE_HEADERS.each do |header|
      next if @headers[header].nil? # The file may not contain the specified header
      field_value = content[@headers[header]]&.strip
      case header
      when :city
        field_value = CITIES_MAPPING[field_value.to_sym] || field_value
      when :birthdate
        field_value = Date::strptime(field_value, @date_format)
      end
      person_params[header] = field_value
    end
    Person.new **person_params
  end
end
