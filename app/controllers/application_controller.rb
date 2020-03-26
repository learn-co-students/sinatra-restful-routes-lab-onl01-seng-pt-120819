class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes/new' do 
    erb :index 
  end

  post '/recipes' do 
    recipe = Recipe.create(params)
    redirect "/recipes/#{recipe.id}"
  end

  get '/recipes/:id' do 
    @recipe = Recipe.find_by(id: params[:id])
    erb :show
  end

  get '/recipes' do 
    @all = Recipe.all 
    erb :all_recipes
  end

  delete '/recipes/:id' do #delete action
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end

  get '/recipes/:id/edit' do  #load edit form
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do #edit action
    @recipe = Article.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end 

  get '/recipes/new' do 

  end
end
