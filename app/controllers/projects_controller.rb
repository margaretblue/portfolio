class ProjectsController < ApplicationController

  def index
    @projects = Project.all
  end
  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project has been created"
      redirect_to @project
    else
      flash.now[:error] =  "Project could not be saved."
      render :new
    end
  end

  def show
    set_project
    #replaces
    #@project = Project.find(params[:id])
  end

  def edit
    set_project
    #replaces
    #@project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      #flash.now[:notice] = "Project Success"
      #redirect_to @project
      redirect_to @project, notice: 'Project was successfully updated. Success'
    end
  end

private

  def project_params
    params.require(:project).permit(:name, :technologies_used)
  end

  def set_project
    @project = Project.find(params[:id])
  end

end
