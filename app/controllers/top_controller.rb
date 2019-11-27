class TopController < ApplicationController
  def index
    @q = current_user.tasks.ransack(params[:q])
    @tasks = @q.result(distinct: true).page(params[:page])
    
    @q = current_user.events.ransack(params[:q])
    @events = @q.result(distinct: true).page(params[:page])

    respond_to do |format|
      format.html
      format.json
    end
  end
end
