class CreateTextPosts < ActiveRecord::Migration
  def change
    create_table :text_posts do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
