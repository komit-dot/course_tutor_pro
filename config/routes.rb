Rails.application.routes.draw do
	namespace :api do 
		namespace :v1 do 
			resources :courses do 
				get 'list_tutors', :on => :collection
			end
			resources :tutors
		end 
	end 
end

