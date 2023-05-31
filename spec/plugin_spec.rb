# frozen_string_literal: true

require "rails_helper"

# Fabricator(:silenced) do
#   user_id { Fabricate(:user).id }
#   silenced { true }
# end

describe ::DiscourseSilencedFlair do
  let(:user) { double("user", silenced: true) }
  # let(:user) { Fabricate.build(:user) }
  # let!(:silenced) { Fabricate(:silenced, user_id: user.id) }

  before { SiteSetting.discourse_silenced_flair_enabled = true }

  it "adds silenced attribute to user card serializer" do
    serializer = UserCardSerializer.new(user)
    expect(serializer.silenced).to eq(true)
  end
end
