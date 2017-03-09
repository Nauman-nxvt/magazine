class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :parent_tag_id

      t.timestamps
    end
  end
end
