import { withPluginApi } from "discourse/lib/plugin-api";
import { iconNode } from "discourse-common/lib/icon-library";

export default {
  name: "discourse-silenced-flair",
  initialize() {
    withPluginApi("0.1", (api) => {
      console.log("hi");
      api.includePostAttributes("silenced");

      const h = require("virtual-dom").h;

      api.createWidget("avatar-flair-silenced", {
        tagName: "div.avatar-flair-silenced",

        html() {
          return h(
            "span",
            iconNode("microphone-slash", {
              class: "avatar-flair-silenced__icon",
              title: "Silenced",
            })
          );
        },
      });

      api.decorateWidget("post-avatar:after", (helper) => {
        const user = helper.getModel();
        if (user && user.get("silenced")) {
          return helper.widget.attach("avatar-flair-silenced");
        }
      });
    });
  },
};
