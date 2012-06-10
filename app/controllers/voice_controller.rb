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
  
  def get_status
  end

end
