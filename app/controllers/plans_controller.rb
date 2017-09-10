class PlansController < ApplicationController

# lists index
  get '/plans' do
    @plans = Plan.all
    erb :'plans/index'
  end

#create new plan
get '/plans/create_plan' do
  erb :'plans/create_plan'
end


end
