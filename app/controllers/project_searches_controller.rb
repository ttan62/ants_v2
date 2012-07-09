class ProjectSearchesController < ApplicationController
  def new
    @project_search = ProjectSearch.new
  end

  def create
    @project_search = ProjectSearch.new(params[:project_search])
    if @project_search.save
      redirect_to @project_search#, :notice => "Successfully created project search."
    else
      render :action => 'new'
    end
  end

  def show
    @project_search = ProjectSearch.find(params[:id])
  end
end
