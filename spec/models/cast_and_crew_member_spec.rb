require 'rails_helper'

RSpec.describe CastAndCrewMember, type: :model do
  it { is_expected.to belong_to :video }
  it { is_expected.to belong_to :person_with_role }
end
