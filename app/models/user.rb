class User
  include Mongoid::Document
  field :provider, type: String
  field :uid, type: String
  field :name, type: String
  field :oauth_token, type: String
  field :oauth_expires_at, type: Time


  has_many :posts
  has_one :image

 def self.from_omniauth(auth)
    user = self.where(auth.slice(:provider, :uid)).first
    if user.nil? 
      user= User.new
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    else 
      return user
    end
  end

   def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
    block_given? ? yield(@facebook) : @facebook
     rescue Koala::Facebook::APIError => e
      logger.info e.to_s
      nil
  end

  def friends_count
      facebook{ |fb| fb.get_connection("me","friends").size }
  end

end
