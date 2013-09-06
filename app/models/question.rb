class Question < ActiveRecord::Base
  has_many :responses
  has_many :choices
  belongs_to :survey
end
