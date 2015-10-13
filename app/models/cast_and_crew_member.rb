class CastAndCrewMember < ActiveRecord::Base
  belongs_to :video
  belongs_to :person_with_role
end
