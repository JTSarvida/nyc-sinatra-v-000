class LandmarksController < ApplicationController
  # add controller methods
  
  get '/landmarks/new' do
    erb :'/landmarks/new'
  end
  
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end
  
  get '/landmarks/:id' do
    @landmark = Landmark.find(params['id'])
    erb :'/figures/show'
  end
  
  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params['id'])
    erb:'/landmarks/edit'
  end
  
  post '/landmarks' do
    @landmark = Landmark.create(params['landmark'])
    redirect "/landmarks"
  end
  
  patch '/landmarks/:id' do
    @landmark = Landmark.find(params['id'])
    @figure.update(params['landmark'])
    @figure.save
    redirect "/landmarks/#{@landmark.id}"
  end
end
