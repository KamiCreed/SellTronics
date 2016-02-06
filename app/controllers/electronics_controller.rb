class ElectronicsController < ApplicationController
  before_action :logged_in_person, only: [:edit, :new, :create, :update, :destroy]
  before_action :admin_person, only: [:edit, :new, :create, :update, :destroy]

  def index
    @electronics = Electronic.paginate(page: params[:page])
  end

  def show
    @electronic = Electronic.find(params[:id])
  end

  def new
    @electronic = Electronic.new
  end

  def edit
    @electronic = Electronic.find(params[:id])
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

  def update
    @electronic = Electronic.find(params[:id])

    if @electronic.update(electronic_params)
      flash[:success] = "Electronic updated"
      redirect_to @electronic
    else
      render 'edit'
    end
  end

  def destroy
    @electronic = Electronic.find(params[:id])
    @electronic.destroy
    flash[:success] = "Electronic deleted"

    redirect_to electronic_path
  end

  private

    def electronic_params
      params.require(:electronic).permit(:name, :desc, :featured)
    end

    # Confirms a logged-in person.
    def logged_in_person
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms an admin person.
    def admin_person
      redirect_to(root_url) unless current_person.admin?
    end
end
