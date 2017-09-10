class PlansController < ApplicationController

# lists index
  get '/plans' do
    @plans = Plan.all
    erb :'plans/index'
  end

end
