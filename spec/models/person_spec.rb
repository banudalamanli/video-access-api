require 'rails_helper'

RSpec.describe Person, type: :model do
	it { is_expected.to have_many(:person_with_roles).dependent(:destroy) }
	it { is_expected.to have_many :roles }

  it { is_expected.to validate_presence_of :name }
end
