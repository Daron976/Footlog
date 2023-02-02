class AddDefaultToImage < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :Image, from: nil, to: 'https://github.com/Daron976/portfolio/blob/main/images/1177568-removebg-preview%20(1).png?raw=true'
  end
end
