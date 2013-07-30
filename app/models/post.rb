class Post
  include Mongoid::Document
  field :content, type: String
  belongs_to :user

  validates_presence_of :content
end
