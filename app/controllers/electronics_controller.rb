class ElectronicsController < ApplicationController

  def index
    @electronics = Electronic.paginate(page: params[:page])
  end

  def new
    @electronic = Electronic.new
  end

  def edit
  end

  def create
    @electronic = Electronic.new(electronic_params)

    # Checks if it is saved in case of bad input
    if @electronic.save
      flash[:success] = "Electronic successfully added!"
      redirect_to @electronic
    else # render 'new' and show error messages
      render 'new'
    end
  end

  def show
    @electronic = Electronic.find(params[:id])
  end

  def destroy
    @electronic = Electronic.find(params[:id])
    @electronic.destroy
    flash[:success] = "Electronic deleted"

    redirect_to electronic_path
  end

  private

    def electronic_params
      params.require(:electronic).permit(:name, :desc)
    end
end
