class VoiceController < ApplicationController
  respond_to :voice
  
  def root
    render :root
  end
end
