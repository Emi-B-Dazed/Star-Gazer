class Location < ApplicationRecord
    validates_presence_of :name, :latitude, :longitude, :pollution
    belongs_to :user, optional: true
end
