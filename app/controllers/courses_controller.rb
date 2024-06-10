class CoursesController < ApplicationController
    def create
      course = Course.new(course_params)
      if course.save
        Rails.logger.debug "Course and tutors saved successfully"
        render json: course.as_json(include: :tutors), status: :created
      else
        error_messages = course.errors.full_messages + course.tutors.map(&:errors).flat_map(&:full_messages)
        Rails.logger.debug "Course save errors: #{error_messages.join(', ')}"
        render json: { errors: course.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def index
      courses = Course.includes(:tutors).all
      render json: courses.to_json(include: :tutors)
    end
  
    private
  
    def course_params
      params.require(:course).permit(:name, tutors_attributes: [:name])
    end
end
  