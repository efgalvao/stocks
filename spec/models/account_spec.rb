require 'rails_helper'

RSpec.describe Account, type: :model do
  let(:account) { create(:account) }
  let(:account2) { create(:account) }

  it "is valid with valid attributes" do
    expect(account).to be_valid
  end

  it "is not valid without a name" do
    account.name = nil
    expect(account).not_to be_valid
  end

  it "is not valid with a duplicate name" do
    account2.name = account.name
    expect(account2).not_to be_valid
  end
end
