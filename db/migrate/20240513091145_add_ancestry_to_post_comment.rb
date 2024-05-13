class AddAncestryToPostComment < ActiveRecord::Migration[7.1]
  def change
    add_column :post_comments, :ancestry, :text
    add_index :post_comments, :ancestry
  end
end
