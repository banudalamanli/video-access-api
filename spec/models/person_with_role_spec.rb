require 'rails_helper'

RSpec.describe PersonWithRole, type: :model do
  it { is_expected.to belong_to :person }
  it { is_expected.to belong_to :role }
  it { is_expected.to have_many(:cast_and_crew_members).dependent(:destroy) }
  it { is_expected.to have_many :videos }
end
