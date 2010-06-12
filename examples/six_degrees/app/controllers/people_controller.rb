class PeopleController < ApplicationController
  respond_to :html

  def index
    @people = Person.all
    respond_with @people
  end

  def new
    @person = Person.new
  end

  def create
    Person.create(params[:person][:name])
    redirect_to :people
  end

  def six_degrees
    @first = Person.find(params[:degrees][:first_person])
    @second = Person.find(params[:degrees][:second_person])

    @degrees = @first.find_separation @second
  end
end
