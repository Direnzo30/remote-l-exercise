require_relative './services/retrieve_persons_service.rb'
require_relative './lib/sorters/sorter.rb'
require_relative './models/person.rb'
class PeopleController

  def initialize(params)
    @params = params
  end

  def normalize
    persons = RetrivePersonsService.call(params)
    Sorter.sort_by_property!(klass: Person, array: persons, property: params[:order])
    persons.map { |person| person.to_normal }
  end

  private

  attr_reader :params
end
