require 'spec_helper'

describe(Store) do
  it { should have_many(:shoes)}
  it { should have_many(:inventories)}
end
