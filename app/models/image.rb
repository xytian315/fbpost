class Image
  include Mongoid::Document
  include Mongoid::Paperclip
  has_mongoid_attached_file :image
  belongs_to :user
end
