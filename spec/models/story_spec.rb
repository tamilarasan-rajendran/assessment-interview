require 'rails_helper'

RSpec.describe Story, type: :model do
  describe 'validations' do
    it 'with all attributes' do
      story = Story.new(title: 'title1', user_name: 'user_name', url: 'https://google.com',
                        description: 'sample test description')
      expect(story).to be_valid
    end
    it 'without empty description' do
      story = Story.new(title: 'title1', user_name: 'user_name', url: 'https://google.com',
                        description: '')
      expect(story).to be_valid
    end

    it 'without description' do
      story = Story.new(title: 'title1', user_name: 'user_name', url: 'https://google.com',
                        description: 'sample test description')
      expect(story).to be_valid
    end

    it 'with empty title' do
      story = Story.new(title: '', user_name: 'user_name')
      expect(story).to be_invalid
    end

    it 'without title' do
      story = Story.new(user_name: 'user_name')
      expect(story).to be_invalid
    end

    it 'with empty user_name' do
      story = Story.new(title: 'title1', user_name: '')
      expect(story).to be_invalid
    end

    it 'without user_name' do
      story = Story.new(title: 'title')
      expect(story).to be_invalid
    end

    it 'with invalid upvotes' do
      story = Story.new(title: 'title1', user_name: 'user_name', url: 'https://google.com',
                        description: 'sample test description', upvotes: 12)
      expect(story).to be_invalid
    end

    it 'with invalid comments count' do
      story = Story.new(title: 'title1', user_name: 'user_name', url: 'https://google.com',
                        description: 'sample test description', comments_count: 12)
      expect(story).to be_invalid
    end
  end

  describe 'stats count' do
    it 'verify comments count is 0 during creation' do
      story = Story.create(title: 'title1', user_name: 'user_name', url: 'https://google.com',
                        description: 'sample test description')
      expect(story.comments_count).equal? 0
    end

    it 'verify upvotes is 0 during creation' do
      story = Story.create(title: 'title1', user_name: 'user_name', url: 'https://google.com',
                        description: 'sample test description')
      expect(story.upvotes).equal? 0
    end
  end
end
