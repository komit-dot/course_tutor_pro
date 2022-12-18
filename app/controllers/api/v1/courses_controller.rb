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
		if @course 
			@course.update(course_params)
			render json: { message: "Course has beer updated successfully."}, status: 200 
		else
			render json: { message: "Unable to update the Course"}, status: 400
		end 
	end 

#DELETE /course/:id
	def destroy 
		if @course
			@course.destroy
			render json: { message: "Course has been deleted successfully."}, status: 200
		else 
			render json: { message: "Unable to delete this Course."}, status: 400
		end 
	end 

	private 

	def course_params 
		params.require(:course).permit(:name, :subject, :duration_month)
	end 

	def find_course
		@course = Course.find(params[:id])
	end 


end
