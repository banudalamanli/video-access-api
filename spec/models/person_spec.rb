require 'rails_helper'
require 'factories'

RSpec.describe Person, type: :model do
  context "associations" do
    it { is_expected.to have_many(:person_with_roles).dependent(:destroy) }
    it { is_expected.to have_many(:roles).through(:person_with_roles) }
  end

  context "validations" do
    it { is_expected.to validate_presence_of :name }

    describe "presence" do
      let(:invalid_person) { build(:person, invalid: true) }

      it "is not saved without a name" do
        expect(invalid_person).to be_invalid
      end
    end
  end

  describe "#roles" do
    let(:person)   { create(:person) }

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

  context "Class methods: scopes" do
    let(:person1)  { create(:person) }
    let(:person2)  { create(:person) }
    let(:actor)    { create(:actor) }
    let(:director) { create(:director) }

    before do
      actor.people << person1
      actor.people << person2
      director.people << person1
    end

    describe "Person#role(role_kind)" do
      it "returns all person records with the role defined in the argument" do
        expect(Person.role("actor")).to eq([person1.name, person2.name])
      end
    end

    describe "Person#actors" do
      it "returns all actor records" do
        expect(Person.actors).to eq([person1.name, person2.name])
      end
    end

    describe "Person#directors" do
      it "returns all director records" do
        expect(Person.directors).to eq([person1.name])
      end
    end
  end
end
