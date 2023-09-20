require 'rails_helper'

RSpec.describe Course, type: :model do
  context 'validation' do
    let(:course) { Course.new }

    describe 'name validate' do
      it 'name can not be empty' do
        expect(course).not_to be_valid
      end

      it 'should has a name error' do
        expect(course.valid?).to be false
        expect(course.errors.messages.key?(:name)).to be true
      end
    end

    describe 'teacher validate' do
      it 'should belongs to a teacher' do
        expect(course).not_to be_valid
      end

      it 'should has a teacher relation error' do
        expect(course.valid?).to be false
        expect(course.errors.messages.key?(:teacher)).to be true
      end
    end
  end
end
