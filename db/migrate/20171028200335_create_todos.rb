class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :name # 名稱
      t.date :due_date # 必需完成時間
      t.string :note # 其它說明
      t.timestamps
    end
  end
end
