require 'rails_helper'

RSpec.describe Chapter, type: :model do
  context 'validation' do
    let(:course) { create(:course) }
    let(:chapter) { Chapter.new(course: course) }
    let(:chapter1) { Chapter.new(name: 'test') }

    describe 'name validate' do
      it 'name can not be empty' do
        expect(chapter).not_to be_valid
      end

      it 'should has a name error' do
        expect(chapter.valid?).to be false
        expect(chapter.errors.messages.key?(:name)).to be true
      end
    end

    describe 'course validate' do
      it 'should belongs to a course' do
        expect(chapter1).not_to be_valid
      end

      it 'should has a course relation error' do
        expect(chapter1.valid?).to be false
        expect(chapter1.errors.messages.key?(:course)).to be true
      end
    end
  end
end
