require 'rails_helper'

describe "DiscourseSilencedFlair" do
  let(:user) { Fabricate(:user) }
  let(:admin) { Fabricate(:admin) }
  let(:post) { Fabricate(:post, user: user) }

  before do
    SiteSetting.discourse_silenced_flair_enabled = true
  end

  it "adds silenced attribute to post serializer" do
    user.update!(silenced_till: 1.day.from_now)
    json = PostSerializer.new(post, scope: Guardian.new(admin)).as_json
    expect(json[:post][:silenced]).to eq(true)
  end

  it "adds silenced attribute to user card serializer" do
    user.update!(silenced_till: 1.day.from_now)
    json = UserCardSerializer.new(user, scope: Guardian.new(admin)).as_json
    expect(json[:user_card][:silenced]).to eq(true)
  end
end