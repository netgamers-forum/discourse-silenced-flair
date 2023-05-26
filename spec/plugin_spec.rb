require 'rails_helper'

describe ::DiscourseSilencedFlair do

  # im sure I need to make a user thats silenced somehow
  let(:user) { Fabricate.build(:user)}
  let!(:silenced) { Fabricate(:silenced, user_id: user.id) }

  before do
    SiteSetting.discourse_silenced_flair_enabled = true
  end


  it "adds silenced attribute to post serializer" do
   
  end

  it "adds silenced attribute to user card serializer" do
    serializer = UserCardSerializer.new(user)
    expect(serializer).to respond_to(:silenced)
    expect(serializer.silenced).to eq(true)
  end

end