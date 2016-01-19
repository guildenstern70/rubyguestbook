class EntryController < ApplicationController
  def list
    @entries = Entry.all
  end

  def show
    @entry = Entry.find(:params[:id])
  end

  def create
  end

  def edit
  end

  def delete
  end

  def new
  end
end
