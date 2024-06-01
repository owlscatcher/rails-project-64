class AddDefaultValueToLikesCount < ActiveRecord::Migration[7.1]
  def change
    change_column_default :posts, :likes_count, 0
  end
end
