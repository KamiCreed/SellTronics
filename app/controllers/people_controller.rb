class PeopleController < ApplicationController
  def index # View for table of all people
    @people = Person.all
  end

  def show # View individual people
    @person = Person.find(params[:id])
  end

  def new
  end

  def create
    @person = Person.new(person_params)

    @person.save
    redirect_to @person
  end

  private
    def person_params
      params.require(:person).permit(:name, :weight, :height, :colour)
    end
end
