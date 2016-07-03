class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string, null: false, default: "未設定"
  end
end
