class MovesController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    if @game.make_move(params[:row].to_i, params[:col].to_i)
      if @game.moves.build(row: params[:move][:row], col: params[:move][:col]).save
          @game.winner?
          @game.game_over?
          result = @game.winner.present? ? true : false
          render json: { success: true, result: result, game: @game }
      else
        flash[:error] = 'Invalid move! Please try again.'
        render json: { success: false, error: 'Invalid move! Please try again.' }
      end
    end
  end

  private

  def move_params
    params.require(:move).permit(:row  , :col)
  end

end
