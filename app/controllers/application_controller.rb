require 'deck'
require 'pry'

class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  post '/users' do
    User.create(username: params[:username], email: params[:email], tokens: 1000)
    user_id = User.find_by(username: params[:username]).id
    Icon.create(icon_name: "User", image_url: "fa-solid fa-user", user_id: user_id, selected: true)
  end

  get '/users/:email' do
    user = User.find_by(email: params[:email])
    user.to_json(only: [:username, :email, :tokens], include: { icons: {only: [:icon_name, :image_url, :selected]}})
  end

  get '/users' do
    users = User.all.order(tokens: :desc).limit(5)
    users.to_json(only: [:username, :email, :tokens], include: { icons: {only: [:icon_name, :image_url, :selected]}})
  end

  delete '/users/:email' do
    user = User.find_by(email: params[:email])
    user.destroy
  end

  get '/users/:email/:bet' do
    user = User.find_by(email: params[:email])
    user.update_attribute(:tokens, params[:bet])
    user.to_json(only: [:username, :email, :tokens], include: { icons: {only: [:icon_name, :image_url, :selected]}})
  end
  
  get '/deck' do
    deck = Deck.new.cards.to_s
    deck.tr('[]', '')
  end

  get '/store_icons' do
    icons = StoreIcon.all
    icons.to_json
  end

  get '/icon/:email/:name/:image_url' do
  user = User.find_by(email: params[:email])
  icon__attrs  = { icon_name: params[:name], 
                     user_id: user.id, 
                     image_url: params[:image_url] }

  icon = Icon.where(icon__attrs).first_or_create
  old_icon = Icon.where(user_id: user.id, selected: true)
  old_icon.update(:selected => false)
  icon.update(:selected => true)
  user = User.find_by(email: params[:email])
  user.to_json(only: [:username, :email, :tokens], include: { icons: {only: [:icon_name, :image_url, :selected]}})
  end

end

