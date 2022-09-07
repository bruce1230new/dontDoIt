require 'securerandom'

class PlayersController < ApplicationController

    def show
        @player = Player.find(params[:id])
        room = @player.room
        @room_name = room.room_name
        @players = room.players
    end

    def index
        @players = Player.all
    end

    def new
        @player = Player.new
        # render plain: "test render"
    end

    def create
        form_params = params.require(:player).permit(:name, :room_name)
        player_name = form_params[:name]
        room_name = form_params[:room_name]
        if room_name.empty?
            room = Room.new(room_name: SecureRandom.urlsafe_base64(5))
            room.save # Warn: Don't forget to save.
        else
            room = Room.where(room_name: room_name).first
        end
        action_id = ProhibitedAction.order(Arel.sql('RANDOM()')).first.id
        @player = Player.new(name: player_name, room_id: room.id, prohibited_action_id: action_id, lives: 5)
        if @player.save
            flash[:notice] = "Player created sucessfully"
            redirect_to player_path(@player)
        else
            render 'new'
        end
        
        # render plain: "test render"
        # render plain: params[:player] # not working
    end

    def update
        @player = Player.find(params[:id])
        action_id = ProhibitedAction.order(Arel.sql('RANDOM()')).first.id
        cur_lives = @player.lives
        if cur_lives > 0
            @player.update(prohibited_action_id: action_id, lives: cur_lives - 1)
        end
        redirect_to @player
    end

    def destroy
        @player = Player.find(params[:id])
        @player.destroy
        redirect_to players_path
    end

end