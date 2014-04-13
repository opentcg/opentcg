require "set"

shared_examples "collector" do
  let(:collector)   { create(described_class.name.underscore.to_sym) }
  let(:collection)  { create(:cardset, cards: [create(:card), create(:card)] ) }

  it { collector.should have_many(:user_cards) }
  it { collector.should have_many(:cards).through(:user_cards) }
  it { collector.should have_many(:cardset_masters) }

  describe "add card" do

    it "should just add the card" do
      collector.user_cards.create(card: collection.cards.first)
      collector.user_cards.size.should == 1
      collector.cardset_masters.size.should == 0
    end

    it "should just create new master and remove cards" do
      collector.user_cards.create(card: collection.cards.first)
      collector.user_cards.create(card: collection.cards[1])
      collector.user_cards.size.should == 0
      collector.cardset_masters.size.should == 1
    end

    it "should just add the card when it is duplocated" do
      collector.user_cards.create(card: collection.cards.first)
      collector.user_cards.create(card: collection.cards.first)
      collector.user_cards.size.should == 2
      collector.cardset_masters.size.should == 0
    end

  end
end