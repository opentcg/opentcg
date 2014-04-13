require "set"

shared_examples "collection" do
  let(:collection) { create(described_class.name.underscore.to_sym) }
  it { collection.should have_many(:cards) }
end