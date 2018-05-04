class ProjectsController < ApplicationController

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      @projects = Project.all
      flash[:info] = "Project Created."
      redirect_to projects_path
    else
      render 'new'
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def index
    @projects = Project.all
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(project_params)
      flash[:success] = "Update Succeeded"
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    Project.find(params[:id]).destroy
    flash[:success] = "Project deleted"
    redirect_to projects_path
  end

  private
    def project_params
      params.require(:project).permit(:name,
          :project_number)
    end
end
