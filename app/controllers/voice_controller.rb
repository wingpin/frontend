class VoiceController < ApplicationController
  respond_to :voice
  
  def root
    render :root
  end
  
  def got_pin
    @pin = params[:Digits]
    @itenerary = Itenerary.first(:conditions => { pin: @pin })
    if @itenerary
      render :got_pin
    else
      render :pin_not_found
    end
  end
  
  def create_message
    @itenerary = Itenerary.find(params[:itenerary_id])
    @access_code = params[:Digits]
    if @itenerary.access_code == @access_code.to_i # authenticated
      render :create_message
    else
      render :bad_code
    end
  end
  
  def post_updates
    @itenerary = Itenerary.find(params[:itenerary_id])
    @recording_for_via_me = params[:RecordingUrl]
    
    if @itenerary.access_code == params[:access_code].to_i # authenticated
      render :post_updates
    else
      render :bad_code
    end
  end

end
