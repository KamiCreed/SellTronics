class ElectronicsController < ApplicationController
  def new
    @electronic = Electronic.new
  end

  def edit
  end

  def create
    @electronic = Electronic.new(electronic_params)

    # Checks if it is saved in case of bad input
    if @electronic.save
      log_in @electronic
      flash[:success] = "Electronic successfully added!"
      redirect_to @electronic
    else # render 'new' and show error messages
      render 'new'
    end
  end

  def show
  end

  private

    def electronic_params
      params.require(:electronic).permit(:name, :desc)
    end
end
