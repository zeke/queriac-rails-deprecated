class User < ActiveRecord::Base
  
  has_many :commands, :dependent => :destroy
  has_many :queries, :through => :commands
  
  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.new(
        provider: auth.provider,
        uid: auth.uid,
        nickname: auth.extra.raw_info.screen_name,
        name: auth.extra.raw_info.name,
        location: auth.extra.raw_info.location,
        image: auth.extra.raw_info.profile_image_url_https,
        description: auth.extra.raw_info.description,
        website: auth.extra.raw_info.url,
      )
    end
    user
  end

end