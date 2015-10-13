class Video < ActiveRecord::Base
	validates :title, :desc, presence: true
end
