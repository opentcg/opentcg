require 'spec_helper'

describe UserCard do
  it { should belong_to(:card) }
  it { should belong_to(:user) }
end
