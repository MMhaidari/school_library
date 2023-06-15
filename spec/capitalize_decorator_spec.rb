require_relative '../decorator/base_decorator'
require_relative '../decorator/capitalize_decorator'
require 'rspec'

describe CapitalizeDecorator do
  let(:nameable) { double('Nameable') }
  subject(:decorator) { CapitalizeDecorator.new(nameable) }

  describe '#correct_name' do
    it 'capitalizes the correct name from the nameable object' do
      expect(nameable).to receive(:correct_name).and_return('john doe')
      expect(decorator.correct_name).to eq('John doe')
    end
  end
end
