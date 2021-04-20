class Api::V1::DialogCheckerController < ApplicationController
  def handleImage(image)
    bits = image.unpack("B*")
    packed = bits.pack("B*")
    datawithouthead = packed.split(' ')[-2]
    File.open(Rails.root.join('public', 'uploads', 'dialog.png'), 'wb') do |file|
      file.write(Base64.decode64(datawithouthead))
    end
  end
  
  def getImage
    File.open(Rails.root.join('public', 'uploads', 'dialog.png'), 'rb') do |file|
      image = Base64.encode64(file.read)
      render json: {image: image}
    end
  end

  def get
    @dialog = DialogChecker.order('created_at').last
    render json: {lock: @dialog.lock}
  end

  def off
    @dialog = DialogChecker.order('created_at').last
    @dialog.lock = false
    @dialog.save()
  end

  def create
    @dialog = DialogChecker.order('created_at').last
    if @dialog.nil?
      @dialog = DialogChecker.new()
    end
    @dialog.lock = true
    @dialog.save()
    handleImage(request.body.read)

  end

  def deleteAll
    DialogChecker.delete_all
    render json: {id: DialogChecker.all}

  end
end

private
  def dialogParams
    params.require(:dialog_checker).permit(:image)
  end