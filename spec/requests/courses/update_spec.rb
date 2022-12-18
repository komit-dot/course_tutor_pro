require 'rails_helper'
RSpec.describe 'Courses', type: :request do
	describe 'PUT /courses' do 
		let!(:course) { Course.create(name:'BBA', subject: 'Business')}
		it 'valid course attributes' do 
			put "/api/v1/courses/#{course.id}", params: {
				course: {
					name: 'BBA2',
					subject: 'Business2',
					duration_month: 12
				}
			}
			expect(response.status).to eq(200)
			json = JSON.parse(response.body).deep_symbolize_keys
			expect(json[:name]).to eq('BBA2')
			expect(json[:subject]).to eq('Business2')

			expect(course.reload.name).to eq('BBA2')
			expect(course.reload.subject).to eq('Business2')
		end 


	end 
end 