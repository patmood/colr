class User < ActiveRecord::Base
  has_many :permissions
  has_many :albums, through: :permissions
  has_many :photos

  def self.parse_twitter(env)
    user = User.find_or_create_by_uid(env['uid'])
    user.update(:name => env['info']['name'],
                :nickname => env['info']['nickname'],
                :profile_url => env['info']['image'])
    return user
  end
end
