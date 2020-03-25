class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  
    erb :new
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end


  post '/recipes' do
    @recipes = Recipe.create(params)

    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])

    erb :show
  end

end
