require_relative '../classes/classroom'

describe Classroom do
  let(:classroom) { Classroom.new('Class A') }
  let(:student) { double('Student') }

  describe '#initialize' do
    it 'sets the label and initializes an empty array of students' do
      expect(classroom.label).to eq('Class A')
      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'adds a student to the classroom and sets the student\'s classroom' do
      allow(student).to receive(:classroom=)

      classroom.add_student(student)
      expect(classroom.students).to include(student)
      expect(student).to have_received(:classroom=).with(classroom)
    end
  end
end
