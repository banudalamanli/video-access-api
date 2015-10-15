require 'rails_helper'

RSpec.describe Video, type: :model do
  it { is_expected.to have_many(:cast_and_crew_members).dependent(:destroy) }
  it { is_expected.to have_many :person_with_roles }
  it { is_expected.to have_many :people }

  
end
