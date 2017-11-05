class UpdateColumn2 < ActiveRecord::Migration[5.1]
  def change
        add_column :todos, :doen,:boolean
  end
end
