class LandmarksController < ApplicationController
  # add controller methods
  
  get '/landmarks/new' do
    erb :'/landmarks/new'
  end
  
  get '/landmarks' do
    @figures = Figure.all
    erb :'/figures/index'
  end
  
  get '/landmarks/:id' do
    @figure = Figure.find(params['id'])
    erb :'/figures/show'
  end
  
  get '/figures/:id/edit' do
    @figure = Figure.find(params['id'])
    erb:'/figures/edit'
  end
  
  post '/figures' do
    @figure = Figure.create(params['figure'])
    
    if !params['title']['name'].empty?
      @figure.titles << Title.create(params['title'])
    end
    
    if !params['landmark']['name'].empty?
      @figure.landmarks << Landmark.create(params['title'])
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end
  
  patch '/figures/:id' do
    @figure = Figure.find(params['id'])
    @figure.update(params['figure'])
    if !params['title']['name'].empty?
      @figure.titles << Title.create(params['title'])
    end
    
    if !params['landmark']['name'].empty?
      @figure.landmarks << Landmark.create(params['landmark'])
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end
end
