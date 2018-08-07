class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
    	# タイトル
      t.string :title, null: false
      #タスクの曜日
      t.integer :week, null: true
      # 時間
      t.datetime :time, null: true
      # t.toDo[] :todo, null: true
      # userモデルのuser_idに結びつけるため、必要
      t.integer :user_id, null: true
      t.timestamps
    end
  end
end