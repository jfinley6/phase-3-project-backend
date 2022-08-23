class User < ActiveRecord::Base
    has_many :icons, dependent: :destroy
end