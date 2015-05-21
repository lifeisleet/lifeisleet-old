class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :title, limit: 255, null: false, index: { unique: true }
      t.string :domain, null: false, index: { unique: true }
      t.string :subtitle, limit: 255, null: false
      t.text :description, limit: 4000, null: false

      t.string :language, null: false
      t.string :category, null: false
      t.string :subcategory
      t.string :owner_name, limit: 255
      t.string :owner_email, limit: 255
      t.boolean :explicit, null: false, default: false

      t.string :livestream_embed_url
      t.string :irc_embed_url
      t.string :irc_room
      t.string :irc_username

      t.boolean :enabled, null: false, default: false
      t.timestamps null: false
    end
  end
end
