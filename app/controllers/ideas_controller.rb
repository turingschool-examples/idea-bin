class IdeasController < ApplicationController
  respond_to :json, :html

  def index
    ideas = { idea: Idea.all }
    respond_with ideas
  end

  def show
    idea = { idea: Idea.find(params[:id]) }
    respond_with idea
  end

  def create
    idea = Idea.new(idea_params)
    if idea.save
      respond_with({ idea: idea }, status: 201, location: idea_path(idea))
    else
      respond_with({ errors: idea.errors }, status: 422, location: ideas_path)
    end
  end

  def update
    idea = Idea.find(params[:id])
    if idea.update(idea_params)
      respond_with({ idea: idea }, status: 200, location: idea_path(idea))
    else
      respond_with({ errors: idea.errors }, status: 422, location: ideas_path)
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:body, :title)
  end
end
