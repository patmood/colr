class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :url
      t.string :colrs
      t.integer :user_id
      t.integer :album_id
      t.timestamps
    end
  end
end
