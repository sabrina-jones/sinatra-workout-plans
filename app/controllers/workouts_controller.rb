require 'pry'

class WorkoutsController < ApplicationController

#index
get '/workouts' do
   @workouts = Workout.find_by_id(params[:id])
   erb :'users/show'
 end

 #create new workout
 get '/workouts/new' do
   #binding.pry
  @plans = Plan.all
  erb :'workouts/new'
 end

 post '/workouts' do
 #  binding.pry
   if params[:name] == ''
     redirect to 'workouts/new'
   else
     user = User.find_by_id(session[:user_id])
     @workout = Workout.create(params)
     redirect to "/workouts/#{@workout.id}"
   end
 end
 #post '/workouts' do
   #Workout.create(params)
  # redirect "/workouts"
 #end

 #show workouts
 get '/workouts/:id' do
    @workout = Workout.find_by_id(params[:id])
    erb :'workouts/show'
  end

#edit workouts
get "/workouts/:id/edit" do
  @workout = Workout.find(params[:id])
  @plans = Plan.all
  erb :'workouts/edit'
end


post "/workouts/:id" do
  @workout = Workout.find(params[:id])
  @workout.update(params.select{|i|i=="name"})
  redirect "/workouts/#{@workout.id}"
end








end
