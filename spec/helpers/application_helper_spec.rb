require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe ApplicationHelper do
    describe "pack" do
      it "removes spaces from a string" do
        expect(helper.pack("first class ")).to eq("firstclass")
      end
    end
  end
end
