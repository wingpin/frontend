class RootController < ApplicationController
  def index
    redirect_to new_iteneraries_path
  end
end
