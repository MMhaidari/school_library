require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age:, name: 'Unknown', parent_permission: true)
    super(age: age, name: name, parent_permission: parent_permission)
    self.classroom = classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def to_json(*_args)
    {
      'type' => 'Student',
      'name' => @name,
      'age' => @age,
      'parent_permission' => @parent_permission,
      'classroom' => @classroom
    }.to_json
  end
end
