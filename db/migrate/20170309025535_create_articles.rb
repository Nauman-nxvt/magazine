class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.references :user, index: true

      t.timestamps
    end
  end
  add_foreign_key :articles, :users
end
