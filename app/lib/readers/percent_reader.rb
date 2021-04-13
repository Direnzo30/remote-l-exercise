require_relative './base_reader.rb'
class PercentReader < BaseReader
	def initialize(file_content)
		super('%', '%Y-%m-%d', file_content)
	end
end