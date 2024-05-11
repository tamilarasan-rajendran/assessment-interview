# frozen_string_literal: true
class CreateStories < ActiveRecord::Migration[7.1]
  def change
    create_table :stories do |t|
      t.string :title
      t.text :description
      t.string :user_name
      t.string :url
      t.integer :upvotes, default: 0
      t.integer :comments_count, default: 0

      t.timestamps
    end
  end
end
