class CreateIcons < ActiveRecord::Migration[6.1]
  def change
    create_table :icons do |t|
      t.string :icon_name
      t.string :image_url
      t.integer :user_id
      t.boolean :selected

      t.timestamps
    end
  end
end
