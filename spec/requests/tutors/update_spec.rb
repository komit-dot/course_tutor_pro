require 'rails_helper'
RSpec.describe 'Tutors', type: :request do
	describe 'PUT /tutors' do 
		let!(:course) { Course.create(name:'BBA', subject: 'Business')}
		let!(:tutor) { Tutor.create(course_id:course.id, full_name: 'AA')}
		it 'valid tutors attributes' do 
			put "/api/v1/tutors/#{tutor.id}", params: {
				tutor: {
					full_name: 'BB',
					address: 'Street',
					mobile_no: 12111
				}
			}
			expect(response.status).to eq(200)
			json = JSON.parse(response.body).deep_symbolize_keys
			expect(json[:message]).to eq('Tutor has been updated successfully.')
			expect(tutor.reload.full_name).to eq('BB')
			expect(tutor.reload.address).to eq('Street')
		end 

		it 'Invalid tutors attributes' do 
			put "/api/v1/tutors/#{tutor.id}", params: {
				tutor: {
					full_name: '',
					address: "Business3",
					mobile_no: 3644,
					course_id: 3333
				}
			}
			expect(response.status).to eq(400)
			json = JSON.parse(response.body).deep_symbolize_keys
			expect(json[:message]).to eq('Unable to update the Tutor')
		end 
	end 
end 