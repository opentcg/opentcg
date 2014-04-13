require "set"

shared_examples "collection" do
  let(:collection) { create(described_class.name.underscore.to_sym) }
  it { collection.should have_many(:cards) }

  describe :increase_number do

    it "should add number 1" do
      collection.cards.create
      collection.cards.last.number.should == 1
    end

    it "should add number 2" do
      collection.cards.create
      collection.cards.create
      collection.cards.first.number.should == 1
      collection.cards.last.number.should == 2
    end

  end
end