class Icon < ActiveRecord::Base
    belongs_to :user
    default_scope { order(selected: :desc) }


end