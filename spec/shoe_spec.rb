require 'spec_helper'

RSpec.describe(Shoe) do
  it { should have_many :inventories }
  it { should have_many :stores }
end