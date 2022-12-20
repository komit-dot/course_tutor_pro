require 'rails_helper'
RSpec.describe "Course", type: :request do
	describe 'GET /list_tutors' do 
		let!(:course1) { Course.create(name:'BBA', subject: 'Business')}
		let!(:course2) { Course.create(name:'MBA', subject: 'Finance')}
		let!(:tutor1) { Tutor.create(course_id:course1.id, full_name: 'AA')}
		let!(:tutor2) { Tutor.create(course_id:course2.id, full_name: 'AA')}

		it 'Get the List of all the courses' do 
			get '/api/v1/courses/list_tutors'
			expect(response.status).to eq(200)
			json = JSON.parse(response.body)
			expect(json.count).to eq(2)
		end 
	end 
end