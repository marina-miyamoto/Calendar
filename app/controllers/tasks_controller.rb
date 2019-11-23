class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = current_user.tasks
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def update
    @task.update!(task_params)
    redirect_to @task, notice: "Task '#{@task.name}' has been updated."
  end

  def create
    @task = Task.new(task_params.merge(user_id: current_user.id))
    
    if @task.save
      redirect_to @task, notice: "Task '#{@task.name}' has been added."
    else
      render :new
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: "Task '#{@task.name}' has been deleted."
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :start_date, :end_date)
  end

  def set_task
    @task = current_user.tasks.find(params[:id])
  end

end
