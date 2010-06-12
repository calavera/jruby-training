class FriendsController < ApplicationController
  def new
    @person = Person.find(params[:person_id])
    @all = Person.all.select {|p| p != @person}
  end

  def create
    @person = Person.find(params[:person_id])
    friend = Person.find(params[:friend][:person_id])

    Person.know_each_other(@person, friend) 

    redirect_to :people
  end
end
