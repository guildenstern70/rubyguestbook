class EntriesController < ApplicationController

    def create

        user_data = params.require(:entry).permit(:title, :message)
        @entry = Entry.new(user_data)
        if @entry.valid?
            user = User.find_by_id(session[:current_user_id])
            @entry.user = user unless user.nil?
            @entry.save()
            redirect_to action: 'new'
        else
            render :new
        end

    end

    def delete
    end

    def edit
    end

    def new
        @entry = Entry.new
    end

    def index
        @entries = Entry.all
    end

    def show
        @entry = Entry.find(id=params[:id])
    end

end
