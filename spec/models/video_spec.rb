require 'rails_helper'

RSpec.describe Video, type: :model do
  it { is_expected.to have_many(:cast_and_crew_members).dependent(:destroy) }
  it { is_expected.to have_many :person_with_roles }
  it { is_expected.to have_many :people }

  it { is_expected.to validate_presence_of(:title).with_message("Missing title field") }
  it { is_expected.to validate_presence_of(:desc).with_message("Missing description field") }
end


=begin

http://blog.davidchelimsky.net/blog/2012/02/12/validations-are-behavior-associations-are-structure/

=end
