require_relative '../decorator/base_decorator'
require_relative '../decorator/nameable'
require_relative '../decorator/trimmer_decorator'

describe TrimmerDecorator do
  let(:nameable) { Nameable.new }
  let(:decorator) { TrimmerDecorator.new(nameable) }

  describe '#correct_name' do
    it 'trims the name to a maximum length of 10 characters' do
      allow(nameable).to receive(:correct_name).and_return('VeryLongName')
      expect(decorator.correct_name).to eq('VeryLongNa...')
    end

    it 'does not trim the name if it is already 10 characters or less' do
      allow(nameable).to receive(:correct_name).and_return('ShortName')
      expect(decorator.correct_name).to eq('ShortName')
    end
  end
end
