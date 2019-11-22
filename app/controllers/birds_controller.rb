class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, except: [:updated_at, :created_at]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird.slice(:id, :name, :species)
    elsif params[:id].class != Integer
      render json: {message: "#{params[:id]} is not a valid bird ID. Please enter a number. "}
    else
      render json: {message: "Sorry, could not find bird with an ID of #{params[:id]}"}
    end  
  end
end