class UpdateColumn < ActiveRecord::Migration[5.1]
  def changep
    add_column :todos, :doen,:boolean
  end
end
