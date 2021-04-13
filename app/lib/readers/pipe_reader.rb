require_relative './base_reader.rb'
class PipeReader < BaseReader
  def initialize(file_content)
    super('|', '%m.%d.%Y', file_content)
  end
end