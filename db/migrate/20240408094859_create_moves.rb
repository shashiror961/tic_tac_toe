class CreateMoves < ActiveRecord::Migration[7.1]
  def change
    create_table :moves do |t|
      t.belongs_to :game, null: false, foreign_key: true
      t.integer :row
      t.integer :col

      t.timestamps
    end
  end
end
