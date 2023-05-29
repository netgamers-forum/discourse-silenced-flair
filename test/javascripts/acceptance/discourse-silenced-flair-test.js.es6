import { click, visit } from "@ember/test-helpers";
import { acceptance } from "discourse/tests/helpers/qunit-helpers";
import { test } from "qunit";
import userFixtures from "discourse/tests/fixtures/user-fixtures";
import { cloneJSON } from "discourse-common/lib/object";

acceptance("Discourse Silenced Flair | User Profile", function (needs) {
  needs.user();

  needs.pretender((server, helper) => {
    const cardResponse = cloneJSON(userFixtures["/u/charlie/card.json"]);
    cardResponse.user.silenced = true;
    server.get("/u/charlie/card.json", () => helper.response(cardResponse));
  });

  test("user has silenced flair", async (assert) => {
    await visit("/t/internationalization-localization/280");
    await click('a[data-user-card="charlie"]');

    assert.ok(
      find(".avatar-flair-silenced .microphone-slash"),
      "silenced flair is displayed"
    );
  });
});
