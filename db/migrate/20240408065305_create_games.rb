class CreateGames < ActiveRecord::Migration[7.1]
  def change
    create_table :games do |t|
      t.text :board, default: [].to_json
      t.string :player1_name
      t.string :player2_name
      t.string :winner
      t.timestamps
    end
  end
end
