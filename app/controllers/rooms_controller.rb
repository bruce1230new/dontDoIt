class RoomsController < ApplicationController

    def show
        @room = Room.find(params[:id])
    end

    def index
        @rooms = Room.all
    end

    def new
        @room = Room.new
    end

    def create
        @room = Room.new(params.require(:room).permit(:room_name))
        if @room.save
            flash[:notice] = "Room created sucessfully"
            redirect_to room_path(@room)
        else
            render 'new'
        end
    end

end