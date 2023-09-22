class CoursesController < ApplicationController
  helper CoursesHelper
  before_action :set_course, only: [:edit, :update, :show, :destroy]

  def index
    @courses = Course.all
  end

  def new
    if flash[:params]
      @course = Course.new(flash[:params])
    else
      @course = Course.new
      @course.chapters.build.units.build
    end
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path, notice: '新增成功'
    else
      flash[:error] = @course.errors.full_messages
      flash[:params] = course_params.to_h
      redirect_to new_course_path
    end
  end

  def edit;end

  def update
    if @course.update(course_params)
      redirect_to courses_path, notice: '更新成功'
    else
      flash[:error] = @course.errors.full_messages
      redirect_to edit_course_path(@course)
    end
  end

  def show;end

  def destroy
    @course.destroy
    redirect_to courses_path, notice: '資料已刪除'
  end

  private

  def set_course
    @course = Course.friendly.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :teacher_id, { chapters_attributes: [:id, :name, :position , units_attributes: [:id, :name, :content, :position]] })
  end
end
