require "set"

shared_examples "collector" do
  let(:collector) { create(described_class.name.underscore.to_sym) }
  it { collector.should have_many(:user_cards) }
  it { collector.should have_many(:cards).through(:user_cards) }
end