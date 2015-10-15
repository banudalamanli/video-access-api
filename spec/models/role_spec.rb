require 'rails_helper'

RSpec.describe Role, type: :model do
	it { is_expected.to have_many(:person_with_roles).dependent(:destroy) }
	it { is_expected.to have_many :people }

  it { is_expected.to validate_presence_of :role }
  it { is_expected.to validate_uniqueness_of :role  }
end
