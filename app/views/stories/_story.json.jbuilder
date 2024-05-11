# frozen_string_literal: true

json.extract! story, :id, :title, :description, :user_name, :url, :upvotes, :comments_count
json.url story_url(story, format: :json)
