require 'rails_helper'

RSpec.describe Teacher, type: :model do
  context 'validation' do
    describe 'name validate' do
      let(:teacher) { Teacher.new }

      it 'name can not be empty' do
        expect(teacher).not_to be_valid
      end
    end
  end
end
