# frozen_string_literal: true

class Comment < ApplicationRecord

  # ======= Validations =========

  validates_presence_of :content, :user_name

  # ============== scopes ============

  default_scope -> { order('created_at DESC') }

  # ============= Associations ==================

  belongs_to :story, counter_cache: true
  has_many :comments, foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Comment', optional: true
end
