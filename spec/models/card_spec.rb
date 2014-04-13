require 'spec_helper'

describe Card do
  let(:collection) { create(:cardset) }
  it { should belong_to(:cardset) }
end
