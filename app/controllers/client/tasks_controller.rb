module Client
  class TasksController < ApplicationController
    def index
      @tasks = Task.all.order(:created_at)
    end

    def create
      @task = Task.create(create_params)
    end

    def update
      @task = Task.find(params[:id])
      @task.update(status: !@task.status)
    end

    def destroy
      @task = Task.find(params[:id])
      @task.destroy
    end

    private

    def create_params
      params.permit(:name, :status)
    end
  end
end
