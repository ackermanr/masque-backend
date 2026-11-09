class CreateNews < ActiveRecord::Migration[8.1]
  def change
    create_table :news do |t|
      t.string :title
      t.text :body
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
