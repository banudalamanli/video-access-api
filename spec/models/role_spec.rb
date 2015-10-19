require 'rails_helper'

RSpec.describe Role, type: :model do
	context "associations" do
		it { is_expected.to have_many(:person_with_roles).dependent(:destroy) }
		it { is_expected.to have_many(:people).through(:person_with_roles) }
	end

	context 'validations' do
	  it { is_expected.to validate_presence_of :role }
	  it { is_expected.to validate_uniqueness_of :role  }

	  describe "presence" do
	    let(:invalid_role) { Role.create role: "" }

	    it "doesn't save without defining role" do
	    	expect(invalid_role).to be_invalid
	    end
	  end

	  describe "uniqueness" do
	    let(:duplicate_role) { Role.create role: "writer" }
	    before { Role.create role: "writer" }

	    it "doesn't save dupes" do
	    	expect(duplicate_role).to be_invalid
	    end
	  end
	end
end
