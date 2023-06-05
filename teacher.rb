require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(id, age:, name: 'Unknown', parent_permission: true, specialization: 'Unknown')
    super(id, name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
