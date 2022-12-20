require 'rails_helper'
RSpec.describe 'Courses', type: :request do
	describe 'DELETE /courses' do 
		let!(:course) { Course.create(name:'BBAA', subject: 'Business')}
		it 'delete course attributes' do 
			delete "/api/v1/courses/#{course.id}" 
			expect(response.status).to eq(200)
			json = JSON.parse(response.body).deep_symbolize_keys
			expect(json[:message]).to eq('Course has been deleted successfully.')
			expect(Course.count).to eq(0)
		end 
	end 
end 