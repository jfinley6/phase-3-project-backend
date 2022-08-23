class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  post '/users' do
    User.create(username: params[:username], email: params[:email], tokens: 100)
    user_id = User.find_by(username: params[:username]).id
    Icon.create(icon_name: "Default", image_url: "fa-solid fa-user", user_id: user_id, selected: true)
  end

  get '/users/:email' do
    user = User.find_by(email: params[:email])
    user.to_json(only: [:username, :email, :tokens], include: { icons: {only: [:icon_name, :image_url, :selected]}})
  end

  get '/users' do
    users = User.all.order(:tokens)
    users.to_json
  end

  delete '/users/:id' do
    User.destroy(params[:id])
  end

end
