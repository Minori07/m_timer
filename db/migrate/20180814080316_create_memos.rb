class CreateMemos < ActiveRecord::Migration[5.2]
  def change
    create_table :memos do |t|
    	#表示する日付
    	t.date :show_at, null: true
    	#内容
    	t.text :content, null: true
    	# userモデルのuser_idに結びつけるため、必要
    	t.integer :user_id, null: true
      t.timestamps
    end
  end
end
