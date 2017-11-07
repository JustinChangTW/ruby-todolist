class ModifyColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :todos, :doen ,:done
  end
end
