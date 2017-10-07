class LandmarksController < ApplicationController

    get '/landmarks/new' do
        erb :'/landmarks/new'
    end
    
    get '/landmarks/:id/edit' do
        @landmark = Landmark.find_by(id=params[:id])
        # binding.pry
        erb :'/landmarks/edit'
    end
    
    get '/landmarks/:id' do
        @landmark = Landmark.find_by(id=params[:id])
        erb :'/landmarks/show'
    end

    get '/landmarks' do
        erb :'/landmarks/index'
    end

    patch '/landmarks/:id' do
        # binding.pry
        @landmark = Landmark.find_by(id=params[:id])
        @landmark.update(:name=>params["landmark"]["name"], :year_completed=>params["landmark"]["year_completed"])
        @landmark.save
        erb :"/landmarks/#{@landmark.id}"
    end
    
    post '/landmarks' do
        # binding.pry
        if !!params["landmark_name"]
            @landmark = Landmark.create(:name=>params["landmark_name"], :year_completed=>params["landmark_year_completed"])
            @landmark.save
            redirect to "/landmarks/#{@landmark.id}"
        end
    end

end