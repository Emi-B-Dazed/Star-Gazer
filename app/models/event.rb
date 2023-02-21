class Event < ActiveRecord::Base
    validates_presence_of :title, :description, :happens_at, :tag, :optimal_location, :public_bool

    has_many :favorites, dependent: :destroy

    belongs_to :user, optional: true

    
end

