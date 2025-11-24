class ActorsController < ApplicationController
  def index
    @actors = Actor.all
    render template: "actors/index"
  end

  def show
    @actor = Actor.find(params[:id])
    render template: "actors/show"
  end

  def create
    @actor = Actor.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      image: params[:image],
      known_for: params[:known_for]
    )

    if @actor.save
      render :show, status: :created
    else
      render json: {errors: @actor.errors}, status: :unprocessable_entity
    end
  end

  def update
    @actor = Actor.find(params[:id])

    @actor.update(
      first_name: params[:first_name] || @actor.first_name,
      last_name: params[:last_name] || @actor.last_name,
      image: params[:image] || @actor.image,
      known_for: params[:known_for] || @actor.known_for
    )
    
    if @actor.valid?
      render :show 
    else 
      render json: {errors: @actor.errors}, status: :unprocessable_entity
    end
  end

  def delete
    @actor = Actor.find(params[:id])

    @actor.destroy

    render json: {message: "Actor File Deleted"}
  end

end
