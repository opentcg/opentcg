require 'spec_helper'

describe CardsetMaster do
  it { should belong_to(:cardset) }
  it { should belong_to(:user) }
end
