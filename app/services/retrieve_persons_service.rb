require_relative './base_service.rb'
require_relative '../constants/person_constants.rb'
require_relative '../lib/readers/dollar_reader.rb'
require_relative '../lib/readers/percent_reader.rb'
require_relative '../lib/readers/pipe_reader.rb'
class RetrivePersonsService < BaseService
  include PersonConstants

  def initialize(params)
    @params = params
  end

  def call
    persons = []
    READERS.each do |reader|
      persons += send("#{reader}_reader").retrieve_persons
    end
    persons
  end

  private

  def dollar_reader
    @dollar_reader ||= DollarReader.new @params[:dollar_format]&.split(NEW_LINE)
  end

  def percent_reader
    @percent_reader ||= PercentReader.new @params[:percent_format]&.split(NEW_LINE)
  end

  def pipe_reader
    @pipe_reader ||= PipeReader.new @params[:pipe_format]&.split(NEW_LINE)
  end
end