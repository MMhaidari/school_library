require_relative '../decorator/nameable'
require_relative '../decorator/base_decorator'
require 'rspec'

describe Decorator do
  let(:nameable) { double('Nameable') }
  subject(:decorator) { Decorator.new(nameable) }

  describe '#initialize' do
    it 'sets the nameable object' do
      expect(decorator.instance_variable_get(:@nameable)).to eq(nameable)
    end
  end

  describe '#correct_name' do
    it 'delegates the call to the nameable object' do
      expect(nameable).to receive(:correct_name)
      decorator.correct_name
    end
  end
end
