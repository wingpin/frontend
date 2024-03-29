
class ItenerariesController < ApplicationController
  def show
    @itenerary = Itenerary.find(params[:id])
  end

  def index
    @iteneraries = Itenerary.all
  end

  def edit
    @itenerary = Itenerary.find(params[:id])
  end

  def new
    @itenerary = Itenerary.new(:itenerary_legs => [IteneraryLeg.new])
  end

  def create
    @itenerary = Itenerary.new(params[:itenerary])
    if @itenerary.valid?
      @itenerary.save
      redirect_to itenerary_path(@itenerary.id)
    else
      render :new
    end
  end

  def update
    @itenerary = Itenerary.find(params[:id])
    @itenerary.update_attributes(params[:itenerary])
    if @itenerary.valid?
      @itenerary.save
    else
      render :edit
    end
  end

  def destroy
    @itenerary = Itenerary.find(params[:id])
    @itenerary.destroy
  end
end
