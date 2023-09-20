require 'rails_helper'

RSpec.describe Course, type: :model do
  context 'validation' do
    describe 'name validate' do
      let(:course) { Course.new }

      it 'name can not be empty' do
        expect(course).not_to be_valid
      end

      it 'should belongs to a teacher' do
        expect(course).not_to be_valid
      end

      it 'should has a name error' do
        expect(course.valid?).to be false
        expect(course.errors.messages.key?(:name)).to be true
      end

      it 'should has a teacher relation error' do
        expect(course.valid?).to be false
        expect(course.errors.messages.key?(:teacher)).to be true
      end
    end
  end
end
