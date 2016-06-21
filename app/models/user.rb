class User < ActiveRecord::Base
  has_one :profile, :as => :profilable
end
