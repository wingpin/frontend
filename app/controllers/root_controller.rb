class RootController < ApplicationController
  respond_to :html, :voice
  
  def index
    respond_to :html do
      redirect_to new_itenerary_path
    end
    respond_to :voice do
    end
  end
end
