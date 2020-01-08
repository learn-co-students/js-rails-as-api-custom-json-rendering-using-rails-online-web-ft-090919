class BirdsController < ApplicationController

  def index
    birds = Bird.all
    # render json: birds

    # below will exclude certain properties
    render json: birds, except: [:created_at, :updated_at]

    # below is same function without Rails abstraction
    # render json: birds.to_json(except: [:created_at, :updated_at])
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: bird

    # below will only render given properties of 'bird' object
    # render json: bird, only: [:id, :name, :species]
    # or 
    if bird # check if record was found
      render json: bird, except: [:created_at, :updated_at]
    else # if record not found, render message
      render json: { message: 'Bird not found' }
    end

  end

end