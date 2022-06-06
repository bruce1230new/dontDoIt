class RoomsController < ApplicationController

    def show
        @room = Room.find(params[:id])
    end

    def index
        @rooms = Room.all
    end

    def new

    end

    def create
        @room = Room.new(params.require(:room).permit(:room_name))
        @room.save
        redirect_to room_path(@room)
    end

end