require 'spec_helper'

describe Card do
  it { should belong_to(:cardset) }
end
