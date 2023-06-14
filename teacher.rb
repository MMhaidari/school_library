require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age:, name: 'Unknown', parent_permission: true, specialization: 'Unknown')
    super(age: age, name: name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*_args)
    {
      'type' => 'Teacher',
      'name' => @name,
      'age' => @age,
      'parent_permission' => @parent_permission,
      'specialization' => @specialization
    }.to_json
  end

  def self.from_json(json_data)
    teacher_data = JSON.parse(json_data)
    Teacher.new(age: teacher_data['age'], name: teacher_data['name'],
                parent_permission: teacher_data['parent_permission'],
                specialization: teacher_data['specialization'])
  end
end
