class User < ActiveRecord::Base
  
  has_many :commands, :dependent => :destroy
  has_many :queries, :through => :commands
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.nickname = auth.extra.raw_info.screen_name
      user.name = auth.extra.raw_info.name
      user.location = auth.extra.raw_info.location
      user.image = auth.extra.raw_info.profile_image_url_https
      user.description = auth.extra.raw_info.description
      user.website = auth.extra.raw_info.url
    end
  end
  
  def to_param
    nickname
  end

end