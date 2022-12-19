require 'rails_helper'
RSpec.describe "Courses", type: :request do

	describe 'GET /courses' do 
		it 'Get the List of all the courses' do 
			get '/api/v1/courses'
			expect(response.status).to eq(200)
		end 
	end 
end