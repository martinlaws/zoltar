class CreateCategoriesTable < ActiveRecord::Migration

  def change
    create_table :categories do |column|
      column.text :title
    end

    remove_column :responses, :category
    add_column :responses, :category_id, :integer
  end

end
