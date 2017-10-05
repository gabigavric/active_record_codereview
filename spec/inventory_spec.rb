describe(Inventory) do
  it { should belong_to(:shoe)}
  it { should belong_to(:store)}
end