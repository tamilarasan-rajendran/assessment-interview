# frozen_string_literal: true

class Story < ApplicationRecord
  # ========== validations ==========

  validates_presence_of :title, :user_name, :created_at
  validates :upvotes, :comments_count, numericality: { equal_to: 0 }, on: :create

  # ========= Scopes =============

  default_scope -> { order('created_at DESC') }

  # ========== Associations =========

  has_many :comments
  has_many :parent_comments, -> { where(parent_id: nil) }, class_name: 'Comment'

  # ========== Callbacks ==========
  before_validation :set_created_time

  # =========== Instance methods ========

  def set_created_time
    self.created_at = Time.current
  end
end
