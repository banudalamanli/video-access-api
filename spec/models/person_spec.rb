require 'rails_helper'

RSpec.describe Person, type: :model do
	context "associations" do
		it { is_expected.to have_many(:person_with_roles).dependent(:destroy) }
		it { is_expected.to have_many(:roles).through(:person_with_roles) }
	end

	context "validations" do
	  it { is_expected.to validate_presence_of :name }

	  describe "presence" do
	    let(:invalid_person) { Person.create name: "" }

	    it "doesn't save without defining name" do
	    	expect(invalid_person).to be_invalid
	    end
	  end
	end
end
