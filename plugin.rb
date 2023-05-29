# frozen_string_literal: true

# name: discourse-silenced-flair
# about: Adds a flair to silenced accounts, only visible to admins
# version: 0.0.1
# authors: chapoi
# url: https://github.com/chapoi/discourse-silenced-flair
# required_version: 2.7.0

enabled_site_setting :discourse_silenced_flair_enabled

register_asset "stylesheets/avatar-flair-silenced.scss"

after_initialize do
  add_to_serializer(:post, :silenced) { object.user.silenced? }
  add_to_serializer(:user_card, :silenced) { object.silenced? }
end
