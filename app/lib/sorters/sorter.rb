module Sorter
  def self.sort_by_property!(klass:, array:, property:, order: :asc)
    return array if !klass.method_defined? property

    if order == :asc
      array.sort! { |elem_1, elem_2| elem_1.send(property) <=> elem_2.send(property) }
    else
      array.sort! { |elem_1, elem_2| elem_2.send(property) <=> elem_1.send(property) }
    end
  end
end
