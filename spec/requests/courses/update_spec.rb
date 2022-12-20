require 'rails_helper'
RSpec.describe 'Courses', type: :request do
	describe 'PUT /courses' do 
		let!(:course) { Course.create(name:'BBA', subject: 'Business')}
		it 'Update valid course attributes' do 
			put "/api/v1/courses/#{course.id}", params: {
				course: {
					name: 'BBA2',
					subject: 'Business2',
					duration_month: 12
				}
			}
			expect(response.status).to eq(200)
			json = JSON.parse(response.body).deep_symbolize_keys
			expect(json[:message]).to eq('Course has been updated successfully.')
			expect(course.reload.name).to eq('BBA2')
			expect(course.reload.subject).to eq('Business2')
		end 

		it 'Invalid course attributes' do 
			put "/api/v1/courses/#{course.id}", params: {
				course: {
					name: '',
					subject: "Business3",
					duration_month: 36
				}
			}
			expect(response.status).to eq(400)
			json = JSON.parse(response.body).deep_symbolize_keys
			expect(json[:message]).to eq('Unable to update the Course')
		end 
	end 
end 