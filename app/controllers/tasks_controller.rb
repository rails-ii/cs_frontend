class TasksController < ApplicationController
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
