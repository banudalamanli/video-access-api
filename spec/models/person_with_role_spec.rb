require 'rails_helper'

RSpec.describe PersonWithRole, type: :model do
  it { is_expected.to belong_to :person }
  it { is_expected.to belong_to :role }
end
