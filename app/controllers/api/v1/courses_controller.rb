class Api::V1::CoursesController < ApplicationController
		before_action :find_course, only: [:show, :update, :destroy]


# to GET the all courses /courses
	def index 
		@courses = Course.all 
		render json: @courses
	end 

#to GET the particular course /course/:id
	def show 
		@course = @course
		render json: @course
	end 

#POST /courses to create new course 
	def create 
		@course = Course.new(course_params)
		if @course.save 
			render json: @course
		else
			render json: {error: 'We can not create the Course.'}, status: 400
		end
	end
#PUT /course/:id to update the particular course
	def update
		if @course.update(course_params)
			render json: { message: "Course has been updated successfully."}, status: 200 
		else
			render json: { message: "Unable to update the Course"}, status: 400
		end 
	end 

	def list_tutors
		courses = Course.includes(:tutors)
		response_array = []
		courses.each do |course|
			response_array << {course: course, tutors: course.tutors}
		end 
		render json: response_array
	end 


#DELETE /course/:id
	def destroy 
		@course.destroy
		render json: { message: "Course has been deleted successfully."}, status: 200
	end 

	private 

	def course_params 
		params.require(:course).permit(:name, :subject, :duration_month)
	end 

	def find_course
		@course = Course.find_by_id(params[:id])
	end 


end
