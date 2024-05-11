# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

path = Rails.root.join('scratch_87.json')
data_array = eval(IO.read(path))

data_array.each do |data|
  data = data.with_indifferent_access
  attributes = {
    user_name: data[:by],
    created_at: Time.at(data[:time]),
    title: data[:title],
    url: data[:url],
    upvotes: data[:url]
  }
  p data[:time]
  Story.create!(attributes)
end
