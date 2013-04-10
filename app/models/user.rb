class User < ActiveRecord::Base
  attr_accessible :name, :password, :remember_token

end
