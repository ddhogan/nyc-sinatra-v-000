class LandmarksController < ApplicationController

    get '/landmarks/new' do
        erb :'/landmarks/new'
    end

    post '/landmarks/:id' do
        # binding.pry
        @landmark = Landmark.create(:name=>params["landmark_name"], :year_completed=>params["landmark_year_completed"])
        @landmark.save
        redirect to "/landmarks/#{@landmark.id}"
    end
    
    get '/landmarks/:id/edit' do
        @landmark = Landmark.find_by(id=params[:id])
        erb :'/landmarks/edit'
    end

    patch '/landmarks/:id' do
        @landmark = Landmark.find_by(id=params[:id])
        @landmark.update(:name=>params["landmark_name"], :year_completed=>params["landmark_year_completed"])
        @landmark.save
        redirect to "/landmarks/#{@landmark.id}"
    end

    get '/landmarks/:id' do
        @landmark = Landmark.find_by(id=params[:id])
        erb :'/landmarks/show'
    end
    
    get '/landmarks' do
        erb :'/landmarks/index'
    end

end
