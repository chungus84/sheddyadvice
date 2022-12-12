require 'rails_helper'

RSpec.describe User, :type => :model do
  it "is not valid without a password" do
    password = User.new(password: nil)
    expect(password).to_not be_valid
  end
  it "is not valid without a email" do
    email = User.new(email: nil)
    expect(email).to_not be_valid
  end
end
