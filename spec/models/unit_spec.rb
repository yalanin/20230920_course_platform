require 'rails_helper'

RSpec.describe Unit, type: :model do
  context 'validation' do
    let(:chapter) { create(:chapter) }
    let(:unit) { Unit.new(chapter: chapter) }
    let(:unit1) { Unit.new(name: 'test', content: 'test') }
    let(:unit2) { create(:unit) }

    describe 'name validate' do
      it 'name can not be empty' do
        expect(unit).not_to be_valid
      end

      it 'should has a name error' do
        expect(unit.valid?).to be false
        expect(unit.errors.messages.key?(:name)).to be true
      end
    end

    describe 'content validate' do
      it 'content can not be empty' do
        expect(unit).not_to be_valid
      end

      it 'should has a content error' do
        expect(unit.valid?).to be false
        expect(unit.errors.messages.key?(:name)).to be true
      end
    end

    describe 'position validate' do
      it 'position can not be empty' do
        expect(unit).not_to be_valid
      end

      it 'position should be numericality' do
        unit.position = 'test'
        unit.valid?
        expect(unit.errors.messages[:position][0]).to eq('is not a number')
      end

      it 'position should grater than zero' do
        unit.position = 0
        unit.valid?
        expect(unit.errors.messages[:position][0]).to eq('must be greater than 0')
      end

      it 'position should be uniq at the same chapter' do
        test_unit = unit2.chapter.units.build
        test_unit.valid?
        expect(test_unit.errors.messages[:position][0]).to eq('has already been taken')
      end
    end

    describe 'chapter validate' do
      it 'should belongs to a chapter' do
        expect(unit1).not_to be_valid
      end

      it 'should has a chapter relation error' do
        expect(unit1.valid?).to be false
        expect(unit1.errors.messages.key?(:chapter)).to be true
      end
    end
  end
end
