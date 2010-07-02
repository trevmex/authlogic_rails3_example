require 'spec_helper'

describe User do
  it "should succeed creating a new :user from the Factory" do
    Factory.create(:user)
  end

  it "should invalid :invalid_user factory" do
    Factory.build(:invalid_user).should be_invalid
  end
end
