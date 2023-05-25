import { acceptance } from "helpers/qunit-helpers";
import { withPluginApi } from "discourse/lib/plugin-api";
import { iconNode } from "discourse-common/lib/icon-library";

acceptance("DiscourseSilencedFlair", {
  loggedIn: true,
  pretend(server, helper) {
    server.get("/t/280/1.json", () => helper.response({}));
  },
});

test("silenced flair is displayed", async (assert) => {
  const user = Discourse.User.current();
  user.set("silenced", true);

  await visit("/t/internationalization-localization/280");

  assert.ok(
    find(".avatar-flair-silenced__icon").length,
    "silenced flair is displayed"
  );
});
