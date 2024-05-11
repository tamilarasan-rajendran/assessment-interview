# frozen_string_literal: true
class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :parent_id
      t.string :user_name
      t.references :story, foreign_key: true

      t.timestamps
    end
  end
end
