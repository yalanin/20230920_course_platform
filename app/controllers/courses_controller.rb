class CoursesController < ApplicationController
  def index
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
      flash[:alert] = @course.errors.full_messages
      flash[:params] = course_params.to_h
      redirect_to new_course_path
    end
  end

  private

  def course_params
    params.require(:course).permit(:name, :teacher_id, { chapters_attributes: [:name, units_attributes: [:name, :content]] })
  end
end
