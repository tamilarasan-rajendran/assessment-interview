# frozen_string_literal: true

class StoriesController < ApplicationController
  before_action :get_story, only: %i[show create_comment like_story]
  skip_before_action :verify_authenticity_token, only: :like_story

  # GET /stories or /stories.json
  def index
    @stories = Story.all
  end

  # GET /stories/1 or /stories/1.json
  def show; end

  # GET /stories/new
  def new
    @story = Story.new
  end

  # POST /stories or /stories.json
  def create
    @story = Story.new(story_params)

    respond_to do |format|
      if @story.save
        format.html { redirect_to story_url(@story), notice: 'Story was successfully created.' }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  def create_comment
    @comment = Comment.new(comment_params)
    @comment.story_id = @story.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to story_url(@story), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def like_story
    @story.increment!(:upvotes, 1)
    head :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def get_story
    @story = Story.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def story_params
    params.require(:story).permit(:title, :description, :user_name, :url, :upvotes, :comments_count)
  end

  def comment_params
    params.require(:comment).permit(:content, :user_name, :parent_id)
  end
end
