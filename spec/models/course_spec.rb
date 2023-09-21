require 'rails_helper'

RSpec.describe Course, type: :model do
  context 'validation' do
    let(:teacher) { create(:teacher) }
    let(:course) { Course.new(teacher: teacher) }
    let(:course1) { Course.new(name: 'test') }

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
        expect(course1).not_to be_valid
      end

      it 'should has a teacher relation error' do
        expect(course1.valid?).to be false
        expect(course1.errors.messages.key?(:teacher)).to be true
      end
    end
  end
end
