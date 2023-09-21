require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the CoursesHelper. For example:
#
# describe CoursesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe CoursesHelper, type: :helper do
  describe '#options_for_teachers' do
    it 'should return a option array' do
      result = helper.options_for_teachers
      expect(result).to be_a Array
    end
  end
end
