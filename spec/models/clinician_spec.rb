require 'spec_helper'

describe Clinician do
  it "should succeed creating a new :clinician from the Factory" do
    Factory.create(:clinician)
  end

  it "should invalid :invalid_clinician factory" do
    Factory.build(:invalid_clinician).should be_invalid
  end
end
