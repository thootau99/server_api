class Api::V1::InterfaceController < ApplicationController
  def new
    name = params[:name]
    newInstance = Interface.new()
    newInstance.name = name
    newInstance.save
    render json: {id: newInstance.id, newInstance: newInstance, name: name}
  end
  def all
    @interfaces = Interface.all
    render json: {interfaces: @interfaces}
  end
  def find
    begin
      id = params[:id]
      findEntity = Interface.find(id)
      render json: {interfaces: findEntity}

    rescue ActiveRecord::RecordNotFound
      findEntity = "not found"
      render json: {interfaces: findEntity}, status: 400

    end
  end

  def change
    begin
      id = params[:id]
      findEntity = Interface.find(id)
      hp = params[:hp]
      mp = params[:mp]
      findEntity.hp = hp
      findEntity.mp = mp
      findEntity.save
      render json: {interfaces: findEntity}
    rescue ActiveRecord::RecordNotFound
      render json: {interfaces: "notfound"}, status: 400
      return
    end
  end

  def quit
    Interface.delete_all
    newInstance = Interface.all
    render json: {success: true, newInstance: newInstance}
  end
end
