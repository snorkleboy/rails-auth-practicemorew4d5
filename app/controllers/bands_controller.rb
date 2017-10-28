class BandsController < ApplicationController

  def index
  end


  def create
    band=Band.new(bands_params)
    if ( band.save)
      redirect_to bands_url
    else
      flash[:error]=band.errors.full_messages
      render :new
    end
  end


  def new
    render :new

  end


  def update
    render :new

  end


  def edit
    render :new
  end


  def show
    render :new
  end

  def destroy
    band=Band.find(params[:id])
    if (band.destroy)
      render :index
    else
      flash[:errors]=band.errors.full_messages
      render :index
    end
  end

  private

  def bands_params
    params.require(:band).permit(:name)
  end
end
