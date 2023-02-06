class CreateDogImages < ActiveRecord::Migration[7.0]
  def change
    create_table :dog_images do |t|
      t.text :title
      t.string :image_id
      t.text :caption
      t.integer :user_id

      t.timestamps
    end
  end
end
