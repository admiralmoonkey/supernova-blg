class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user

  validates :body, presence: true
  validates :commenter, presence: true
  validates :article, presence: true
  validates :user, presence: true
end
