class WorkoutsController < ApplicationController

#index
get '/workouts' do
   @workouts = Workout.find_by_id(params[:id])
   erb :'users/show'
 end

 #create new workout
 get '/workouts/new' do
  @plans = Plan.all
  erb :'workouts/new'
end


end
