require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  get '/recipes' do 
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do 
    erb :new
  end

  post '/recipes' do 
    @recipes = Recipe.all
    @recipe = Recipe.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time])
    @recipe.save

    redirect to "/recipes/#{@recipe.id}"
    # binding.pry
  end

  get '/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    
    erb :show
    # binding.pry
  end

  get '/recipes/:id/edit' do 
    @recipe = Recipe.find(params[:id])
    
    erb :edit
  end

  patch '/recipes/:id' do 
  
    @recipe = Recipe.find(params[:id])
    @recipe.update(id: params[:id])
    @recipe.update(name: params[:name])
    @recipe.update(ingredients: params[:ingredients])
    @recipe.update(cook_time: params[:cook_time])
    redirect "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do 
    Recipe.destroy(params[:id])

    redirect to '/recipes'
  end
end