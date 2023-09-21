module CoursesHelper
  def options_for_teachers
    Teacher.all.map { |t| [t.name, t.id] }
  end
end
