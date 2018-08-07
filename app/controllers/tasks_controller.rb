class TasksController < ApplicationController
  def index
  @tasks = current_user.tasks
end

def show
  @task = target_task params[:id]
end

def new
  @task = Task.new
end

def create
  @task = current_user.tasks.new task_params
  @task.save!
  redirect_to tasks_path
end

def edit
  @task = target_task params[:id]
end

def update
  @task = target_task params[:id]
  @task.update(task_params)
  redirect_to @task
end

def destroy
  @task = target_task params[:id]
  @task.destroy
  redirect_to tasks_url
end

def week
end

def alarm
end

def list
  @tasks = target_task params[:week]
end

private
  def target_task task_id
    current_user.tasks.where(id: task_id).take
  end

  def target_task task_week
    current_user.tasks.where(week: task_week).order("time")
  end

  def task_params
    params.require(:task).permit(:title, :week, :time)
  end
end
