class VoiceController < ApplicationController
  respond_to :voice
  
  def root
    render :root
  end
  
  def got_pin
    @pin = params[:Digits]
    begin
      @itenerary = Itenerary.find_by(pin: @pin)
      render :got_pin
    rescue Mongoid::Errors::DocumentNotFound
      render :pin_not_found
    end
  end

end
