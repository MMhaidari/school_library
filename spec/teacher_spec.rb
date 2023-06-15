require_relative '../classes/teacher'
require 'rspec'
require 'json'

describe Teacher do
  context 'Create a person of type teacher' do
    before(:each) do
      @teacher = Teacher.new(age: 32, name: 'Zed', parent_permission: true, specialization: 'science')
    end

    it "Create a teacher with 'age, name, and specialization'" do
      expect(@teacher).to have_attributes(age: 32)
      expect(@teacher).to have_attributes(name: 'Zed')
      expect(@teacher).to have_attributes(specialization: 'science')
    end

    it "Method 'can_use_services?' to be true" do
      expect(@teacher.can_use_services?).to be true
    end

    it "Teacher conversion 'to json'" do
      json_data = @teacher.to_json
      expect(JSON.parse(json_data)).to eq({
                                            'type' => 'Teacher',
                                            'name' => 'Zed',
                                            'parent_permission' => true,
                                            'age' => 32,
                                            'specialization' => 'science'
                                          })
    end
  end
end
