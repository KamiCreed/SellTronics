class PeopleController < ApplicationController
  before_action :logged_in_person, only: [:index, :edit, :update]
  before_action :correct_person, only: [:edit, :update]

  def index # Finds data for all people
    @people = Person.all
  end

  def show # Finds individual people
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
  end

  def edit
    @person = Person.find(params[:id])
  end

  def create
    @person = Person.new(person_params)

    # Checks if it is saved in case of bad input
    if @person.save
      log_in @person
      flash[:success] = "Welcome to SellTronics!"
      redirect_to @person
    else # render 'new' and show error messages
      render 'new'
    end
  end

  def update
    @person = Person.find(params[:id])

    if @person.update(person_params)
      flash[:success] = "Profile updated"
      redirect_to @person
    else
      render 'edit'
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy

    redirect_to people_path
  end

  private

    def person_params
      params.require(:person).permit(:name, :email, :password, :password_confirmation, :weight, :height, :colour)
    end

    # Before filters

    # Confirms a logged-in person.
    def logged_in_person
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # Confirms the correct person.
    def correct_person
      @person = Person.find(params[:id])
      redirect_to(root_url) unless current_person?(@person)
    end
end
