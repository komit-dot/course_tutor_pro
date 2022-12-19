require 'rails_helper'
RSpec.describe "Tutors", type: :request do

	describe 'POST /courses' do 
		it 'valid courses attributes' do 
			post '/api/v1/courses', params: {
				course: {
					name: 'BCA',
					subject: 'Computer',
					duration_month: 12
				}
			}

			expect(response.status).to eq(200)
			json = JSON.parse(response.body).deep_symbolize_keys
			expect(json[:name]).to eq('BCA')
			expect(json[:subject]).to eq('Computer')
			expect(json[:duration_month]).to eq(12)
			expect(Course.count).to eq(1)
			expect(Course.last.subject).to eq('Computer')
		end 

		it 'invalid course attributes' do  
			post '/api/v1/courses', params: {
				course: {
					name: '',
					subject: 'Computer'
				}
			}

			expect(response.status).to eq(400)

			json = JSON.parse(response.body).deep_symbolize_keys
			expect(json[:error]).to eq("We can not create the Course.")
			expect(Course.count).to eq(0)
		end 
	end 
end