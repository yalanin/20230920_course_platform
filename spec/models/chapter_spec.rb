require 'rails_helper'

RSpec.describe Chapter, type: :model do
  context 'validation' do
    let(:course) { create(:course) }
    let(:chapter) { Chapter.new(course: course) }
    let(:chapter1) { Chapter.new(name: 'test') }
    let(:chapter2) { create(:chapter) }

    describe 'name validate' do
      it 'name can not be empty' do
        expect(chapter).not_to be_valid
      end

      it 'should has a name error' do
        expect(chapter.valid?).to be false
        expect(chapter.errors.messages.key?(:name)).to be true
      end
    end

    describe 'position validate' do
      it 'position can not be empty' do
        expect(chapter).not_to be_valid
      end

      it 'position should be numericality' do
        chapter.position = 'test'
        chapter.valid?
        expect(chapter.errors.messages[:position][0]).to eq('is not a number')
      end

      it 'position should grater than zero' do
        chapter.position = 0
        chapter.valid?
        expect(chapter.errors.messages[:position][0]).to eq('must be greater than 0')
      end

      it 'position should be uniq at the same course' do
        test_chapter = chapter2.course.chapters.build
        test_chapter.valid?
        expect(test_chapter.errors.messages[:position][0]).to eq('has already been taken')
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
