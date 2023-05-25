# frozen_string_literal: true

module DiscourseSilencedFlair
  class InfoController < ::ApplicationController
    requires_plugin DiscourseSilencedFlair

    add_to_serializer(:post, :silenced) { object.user.silenced? }
  end
end
