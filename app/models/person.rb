require 'date'
class Person
  attr_accessor :first_name, :last_name, :city, :birthdate

  def initialize(first_name: nil, city: nil, birthdate: nil, last_name: nil)
    @first_name = first_name
    @city = city
    @birthdate = birthdate
    @last_name = last_name
  end

  def to_normal
    "#{first_name}, #{city}, #{birthdate&.strftime('%-m/%-d/%Y')}"
  end
end
