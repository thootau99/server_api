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
    rescue ActiveRecord::RecordNotFound
      findEntity = "not found"
    end
    print findEntity
    render json: {interfaces: findEntity}
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
      render json: {interfaces: "notfound"}
      return
    end
  end

  def quit
    Interface.delete_all
    newInstance = Interface.all
    render json: {success: true, newInstance: newInstance}
  end
end
