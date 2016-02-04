class PeopleController < ApplicationController
  def index # View for table of all people
    @people = Person.all
  end

  def show # View individual people
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

    # In case of bad input
    if @person.save
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
      params.require(:person).permit(:name, :weight, :height, :colour)
    end
end
