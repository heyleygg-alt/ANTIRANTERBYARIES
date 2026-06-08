const login = require("@dongdev/fca-unofficial");

login({ appState: require("./appstate.json") }, (err, api) => {
  if (err) return console.error(err);
  api.setOptions({ listenEvents: true });
  api.listenMqtt((e, ev) => {
    if (e) return console.error(e);
    if (ev.type === "message") api.sendMessage(ev.body, ev.threadID);
  });
});
