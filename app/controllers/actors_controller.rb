class ActorsController < ApplicationController
  def index
    actors = Actor.all
    render formulate: actors
  end
end
