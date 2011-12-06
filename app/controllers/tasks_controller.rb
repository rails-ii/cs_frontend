class TasksController < ApplicationController
  def index
    respond_to do |format|
      format.json do
        render :json => { :tasks => Task.all }
      end
    end
  end
  def create
    respond_to do |format|
      format.json do
        Task.create(:name => params[:name])
        puts "here"
        render :json => {
        }
      end
    end
  end
end
