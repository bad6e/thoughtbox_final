class Link < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :link, :url => true
end
