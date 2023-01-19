class AddDefaultToUser < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :PostCounter, from: nil, to: 0
  end
end
