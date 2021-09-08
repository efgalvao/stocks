require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user)}

  it "is valid with valid attributes" do
    expect(user).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
