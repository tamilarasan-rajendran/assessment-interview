require 'rails_helper'
RSpec.describe Comment, type: :model do
  describe 'validations' do
    story = Story.create(title: 'title1', user_name: 'user_name', url: 'https://google.com',
                         description: 'sample test description')
    it 'with valid attributes' do
      comment = Comment.new(content: 'useful content, keep it up', user_name: 'user_name', story_id: story.id)
      expect(comment).to be_valid
    end

    it 'with empty content' do
      comment = Comment.new(content: '', user_name: 'user_name', story_id: story.id)
      expect(comment).to be_invalid
    end

    it 'with empty content' do
      comment = Comment.new(user_name: 'user_name', story_id: story.id)
      expect(comment).to be_invalid
    end

    it 'with empty user_name' do
      comment = Comment.new(content: 'useful content, keep it up', user_name: '', story_id: story.id)
      expect(comment).to be_invalid
    end

    it 'withot user_name' do
      comment = Comment.new(content: 'useful content, keep it up', story_id: story.id)
      expect(comment).to be_invalid
    end
  end

  describe 'associations' do
    it 'belongs to story' do
      comment = Comment.new(content: 'useful content, keep it up', user_name: 'user_name')
      expect(comment).to be_invalid
    end
  end

  describe 'counter caches' do
    story = Story.create(title: 'title1', user_name: 'user_name', url: 'https://google.com',
                         description: 'sample test description')

    it 'verify counter cache increment' do
      comments_count = story.comments_count
      Comment.create(content: 'useful content, keep it up', user_name: 'user_name', story_id: story.id)
      expect(story.comments_count).eql? comments_count + 1
      Comment.create(content: 'can you give the sources', user_name: 'user_name', story_id: story.id)
      expect(story.comments_count).eql? comments_count + 2
    end

    it 'verify counter cache with associations' do
      Comment.create(content: 'useful content, keep it up', user_name: 'user_name', story_id: story.id)
      Comment.create(content: 'can you give the sources', user_name: 'user_name', story_id: story.id)
      expect(story.comments_count).eql? story.comments.count
    end
  end
end
