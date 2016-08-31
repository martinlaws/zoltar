class CreateBaseTables < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :username
      t.string :avatar_url
      t.string :email
      t.string :password
      t.timestamps
    end

    create_table :posts do |t|
      t.references :user
      t.string :photo_url
      t.timestamps
    end
  end

end
