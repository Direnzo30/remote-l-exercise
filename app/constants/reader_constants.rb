module ReaderConstants

  POSSIBLE_HEADERS = %i[
    first_name
    last_name
    city
    birthdate
  ].freeze

  CITIES_MAPPING = {
    LA: 'Los Angeles',
    NYC: 'New York City'
  }.freeze
end
