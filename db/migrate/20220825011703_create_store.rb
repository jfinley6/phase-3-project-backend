class CreateStore < ActiveRecord::Migration[6.1]
  def change
    create_table :store_icons do |t|
      t.string :name
      t.string :image_url
    end
  end
end
