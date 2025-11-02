class ActorsController < ApplicationController
  def index
    @actors = Actor.all
    render template: "actors/index"
  end

  def show
    @actor = Actor.find(params[:id])
    render template: "actors/show"
  end
end
