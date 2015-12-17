class AddUserIdColumnToImageLinks < ActiveRecord::Migration
  def change
    change_table :image_links do |t|
    t.integer :user_id, :index => true
    end
  end
end
