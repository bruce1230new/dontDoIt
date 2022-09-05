class ProhibitedActionsController < ApplicationController

    def show
        @prohibited_action = ProhibitedAction.find(params[:id])
    end

    def index
        @prohibited_actions = ProhibitedAction.all
    end

    def new
        @prohibited_action = ProhibitedAction.new
    end

    def create
        @prohibited_action = ProhibitedAction.new(params.require(:prohibited_action).permit(:name))
        if @prohibited_action.save
            flash[:notice] = "Room created sucessfully"
            redirect_to prohibited_action_path(@prohibited_action)
        else
            render 'new'
        end
    end

    def destroy
        @room = ProhibitedAction.find(params[:id])
        @room.destroy
        redirect_to prohibited_actions_path
    end

end