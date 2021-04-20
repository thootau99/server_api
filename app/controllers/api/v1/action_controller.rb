class Api::V1::ActionController < ApplicationController
  def create
    @action = Action.order('created_at').last
    if @action.nil?
      @action = Action.new()
    end
    id = params[:id]
    @action.action = id
    @action.perform = false
    @action.save()
    render json: {action: @action, id: id}
  end
  def get
    @action = Action.order('created_at').last
    
    render json: {perform: @action.perform, action: @action.action}
  end

  def off
    @action = Action.order('created_at').last
    @action.perform = true
    @action.save()
  end

  def destroy
    Action.delete_all
    render json: {success: true}
  end
end
