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








end
