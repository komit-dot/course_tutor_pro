require 'rails_helper'
RSpec.describe 'Tutors', type: :request do
	describe 'DELETE /tutors' do 
		let!(:course) { Course.create(name:'BBA', subject: 'Business')}
		let!(:tutor) { Tutor.create(course_id:course.id, full_name: 'AA')}
		it 'valid course attributes' do 
			delete "/api/v1/tutors/#{tutor.id}" 
			expect(response.status).to eq(200)
			json = JSON.parse(response.body).deep_symbolize_keys
			expect(json[:message]).to eq('Tutor deleted successfully.')
			expect(Tutor.count).to eq(0)
		end 
	end 
end 