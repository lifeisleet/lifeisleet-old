class CreateUserShowAssociations < ActiveRecord::Migration
  def change
    create_table :user_show_associations do |t|
      t.references :user, index: true, foreign_key: true
      t.references :show, index: true, foreign_key: true
      t.boolean :is_owner, null: false, default: false

      t.timestamps null: false

      t.index [:user_id, :show_id], unique: true
    end
  end
end
