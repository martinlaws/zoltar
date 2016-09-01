class CreateBaseTables < ActiveRecord::Migration

  def change
    create_table :responses do |column|
      column.text :content
      column.text :photo_url
      column.text :category
      column.timestamps, null: false
    end
  end

end
