"use strict";
const TravelAgencyMainAbl = require("../../abl/travel-agency-abl.js");

class TravelAgencyController {
  init(ucEnv) {
    return TravelAgencyMainAbl.init(ucEnv.getUri().getAwid(), ucEnv.getDtoIn());
  }

  load(ucEnv) {
    return TravelAgencyMainAbl.load(ucEnv.getUri().getAwid());
  }

  update(ucEnv) {
    return TravelAgencyMainAbl.update(ucEnv.getUri().getAwid(), ucEnv.getDtoIn());
  }
}

module.exports = new TravelAgencyController();
