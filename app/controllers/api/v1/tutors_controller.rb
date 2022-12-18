class Api::V1::TutorsController < ApplicationController
	before_action :find_tutor, only: [:show, :update, :destroy]

	def index
		@tutors = Tutor.all 
		render json: @tutors
	end 

	def show
		@tutor = @tutor
		render json: @tutor

	end 

	def create
		@tutor = Tutor.new(tutor_params)
		if @tutor.save 
			render json: @tutor
		else 
			render errors: {eror: 'Unable to create Tutor.'}, status: 400
		end
	end 

	def update
		if @tutor 
			@tutor.update(tutor_params)
			render json: { message: "Tutor has been updated successfully."}, status: 200 
		else
			render json: { message: "Unable to update the Tutor"}, status: 400
		end 
	end 

	def destroy 
		if @tutor
			@tutor.destroy 
			render json: {message: "Tutor deleted successfully."}, status: 200
		else 
			render json: {message: "Unable to delete this Tutor"}, status: 400
		end 
	end 

	private 

	def tutor_params
	 params.require(:tutor).permit(:course_id, :full_name, :address, :mobile_no, :email)
	end

	def find_tutor
		@tutor = Tutor.find(params[:id])
	end

end
