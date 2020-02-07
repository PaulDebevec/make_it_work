class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:project_id])
  end

  def add_contestant
    contestant = Contestant.find(params[:contestant_id])
    project = Project.find(params[:project_id])
    project.contestants << contestant # I can't help but feel like this isn't right. It works - But please advise!
    redirect_to "/projects/#{project.id}"
  end
end
