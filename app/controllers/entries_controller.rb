class EntriesController < ApplicationController

    def create
        user_data = params.require(:entry).permit(:title, :message)
        @entry = Entry.new(user_data)
        if @entry.valid?
            user = User.find_by_id(session[:current_user_id])
            @entry.user = user unless user.nil?
            @entry.save()
            redirect_to action: 'index'
        else
            render :new
        end
    end

    def destroy
        @entry = Entry.find(id=params[:id])
        @entry.destroy!
        redirect_to action: 'index'
    end

    def edit
        @entry = Entry.find(params[:id])
    end

    def update
        @entry = Entry.find(params[:id])
        user_data = params.require(:entry).permit(:title, :message)
        # Se l'operazione di update va a buon fine
        if @entry.update_attributes(user_data)
            redirect_to :action => 'index'
        else
            render :action => 'edit'
        end
    end

    def new
        @entry = Entry.new
    end

    def index
        @entries = Entry.all.order(updated_at: :desc)
    end

    def show
        @entry = Entry.find(id=params[:id])
    end

end
