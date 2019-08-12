require 'rails_helper'
require 'support/factory_girl'
RSpec.describe List, type: :model do
  it "has a valid list" do
    expect(FactoryGirl.create(:list)).should be_valid
  end
end
