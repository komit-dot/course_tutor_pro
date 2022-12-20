require 'rails_helper'
RSpec.describe "Tutors", type: :request do
	describe 'GET /tutors' do 
		it 'Get the list of all the tutors' do 
			get '/api/v1/tutors'
			expect(response.status).to eq(200)
		end 
	end 
end