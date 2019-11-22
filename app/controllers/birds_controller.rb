class BirdsController < ApplicationController

  def index
    birds = Bird.all
    # render json: birds, only: [:id, :name, :species]
    render json: birds, except: [:created_at, :updated_at]
    # under the hood - can be written as: render json: birds.to_json(except: [:created_at, :updated_at])
    ##using only or except instead of slice to return limited data
  end

  def show
    bird = Bird.find_by(id: params[:id])
      if bird
        render json: {id: bird.id, name: bird.name, species: bird.species } 
        # above can also be written as: render json: bird.slice(:id, :name, :species)
        ## using slice to return only part of data - slice doesn't work in index - use only: instead
      else 
        render json: { message: 'Bird not found, please enter a valid id number'}
      end
    end

end