class PeopleController < ApplicationController
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
      flash[:success] = "Welcome to SellTronics!"
      redirect_to @person
    else # render 'new' and show error messages
      render 'new'
    end
  end

  def update
    @person = Person.find(params[:id])

    if @person.update(person_params)
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
end
