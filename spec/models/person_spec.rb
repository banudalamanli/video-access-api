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

	    it "is not saved without a name" do
	    	expect(invalid_person).to be_invalid
	    end
	  end
	end

	describe "#roles" do
		let(:person)   { Person.create name: "John Smith" }

		before do
			person.roles.create role: "actor"
			person.roles.create role: "director"
		end

	  it "returns person's role records" do
	  	expect(person.roles.map(&:role)).to eq(["actor", "director"])
	  end

	  it "returns all of the person's roles" do
	  	expect(person.roles.count).to eq 2
	  end
	end
end
