class CreateArticleLinks < ActiveRecord::Migration
  def change
    create_table :article_links do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
