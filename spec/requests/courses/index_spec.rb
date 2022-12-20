require 'rails_helper'
RSpec.describe "Courses", type: :request do
	describe 'GET /courses' do 
		let!(:course) { Course.create(name:'BBA', subject: 'Business')}
		it 'Get the List of all the courses' do 
			get '/api/v1/courses'
			expect(response.status).to eq(200)
			expect(Course.count).to eq(1)
		end 
	end 
end