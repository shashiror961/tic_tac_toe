class GamesController < ApplicationController
  def index
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    @game.update(board: Array.new(3) { Array.new(3) })
    if @game.save
      redirect_to @game
    else
      render 'index'
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  private 

  def game_params
    params.require(:game).permit(:player1_name  , :player2_name)
  end
end
