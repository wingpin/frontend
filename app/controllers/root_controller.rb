class RootController < ApplicationController
  
  def index
    respond_to do |format|
      format.html do
        redirect_to new_itenerary_path
      end
      format.voice
    end
  end

end
