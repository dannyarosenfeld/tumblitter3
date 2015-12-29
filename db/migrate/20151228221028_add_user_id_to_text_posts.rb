class AddUserIdToTextPosts < ActiveRecord::Migration
  def change
    add_column :text_posts, :user_id, :integer
  end
end
