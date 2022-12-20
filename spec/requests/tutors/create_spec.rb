require 'rails_helper'
RSpec.describe "Tutors", type: :request do
	describe 'POST /tutors' do 
		let!(:course) { Course.create(name:'BBA', subject: 'Business')}
		it 'valid tutors attributes' do 
			post '/api/v1/tutors', params: {
				tutor: {
					course_id: course.id,
					full_name: 'Aashish'
				}
			}
			expect(response.status).to eq(200)
			json = JSON.parse(response.body).deep_symbolize_keys
			expect(json[:course_id]).to eq(1)
			expect(json[:full_name]).to eq('Aashish')
			expect(Tutor.count).to eq(1)
			expect(Tutor.last.full_name).to eq('Aashish')
		end 

		it 'invalid tutor attributes' do  
			post '/api/v1/tutors', params: {
				tutor: {
					course_id: '',
					full_name: 'Bina'
				}
			}
			expect(response.status).to eq(400)
			json = JSON.parse(response.body).deep_symbolize_keys
			expect(json[:error]).to eq("Unable to create Tutor.")
			expect(Tutor.count).to eq(0)
		end 
	end 
end