class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :user

  scope :public_questions, -> { where(private: false) }
  scope :search, -> (query) { where("title LIKE ?", query) }
end
