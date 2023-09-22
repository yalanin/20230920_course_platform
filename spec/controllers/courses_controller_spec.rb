require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  let!(:teacher) { create(:teacher) }
  let!(:course) { create(:course, name: 'test') }
  let!(:chapter) { create(:chapter, name: 'test1') }
  let!(:course1) { create(:course, chapters: [create(:chapter, :with_units)]) }
  login_admin

  describe "#new" do
    it 'should create new course with empty nested attributes' do
      get :new
      expect(assigns(:course).class).to be Course
      expect(assigns(:course).id).to be nil
      expect(assigns(:course).chapters.ids).to be_empty
      expect(assigns(:course).units.ids).to be_empty
    end

    it 'should create new course with nested attributes' do
      allow_any_instance_of(CoursesController).to receive(:flash).and_return({ params: {"name"=>"test", "teacher_id"=> teacher.id, "chapters_attributes"=>{"0"=>{"name"=>"test1", "units_attributes"=>{"0"=>{"name"=>""}}}}}})
      get :new
      expect(assigns(:course).name).to eq (course.name)
      expect(assigns(:course).teacher.id).to eq (teacher.id)
      expect(assigns(:course).chapters[0].name).to eq (chapter.name)
      expect(assigns(:course).units).to be_empty
    end
  end

  describe "#create" do
    it 'should create new course with nested attributes' do
      get :create, params: {"course"=>{"name"=> course1.name, "teacher_id"=> course1.teacher.id, "chapters_attributes"=>{"0"=>{"name"=> course1.chapters[0].name, "units_attributes"=>{"0"=>{"name"=> course1.units[0].name, "content"=> course1.units[0].content}}}}}}
      expect(flash[:notice]).to eq('新增成功')
      expect(response).to redirect_to('/courses')
    end

    it 'should create new course failed' do
      get :create, params: {"course"=>{"name"=> "", "teacher_id"=> course1.teacher.id, "chapters_attributes"=>{"0"=>{"name"=> course1.chapters[0].name, "units_attributes"=>{"0"=>{"name"=> course1.units[0].name}}}}}}
      expect(flash[:error]).not_to be_empty
      expect(response).to redirect_to('/courses/new')
    end
  end
end
