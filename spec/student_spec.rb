require_relative '../classes/student'
require 'rspec'
require 'json'

describe Student do
  let(:classroom) { double('Classroom', students: []) }

  subject(:student) { Student.new(classroom, age: 12, name: 'Tiz', parent_permission: true) }

  describe '#play_hooky' do
    it "returns '¯\\(ツ)/¯'" do
      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end

  describe '#classroom=' do
    it 'sets the classroom and adds the student to the classroom\'s students list' do
      new_classroom = double('Classroom', students: [])
      student.classroom = new_classroom
      expect(student.classroom).to eq(new_classroom)
      expect(new_classroom.students).to include(student)
    end

    it 'does not add the student to the classroom\'s students list if already included' do
      student.classroom = classroom
      expect(classroom.students).to receive(:include?).with(student).and_return(true)
      expect(classroom.students).not_to receive(:push)
      student.classroom = classroom
    end
  end
end
