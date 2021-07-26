"use strict";
const TripAbl = require("../../abl/trip-abl.js");

class TripController {

  delete(ucEnv) {
    return TripAbl.delete(ucEnv.getUri().getAwid(), ucEnv.getDtoIn());
  }

  update(ucEnv) {
    return TripAbl.update(ucEnv.getUri().getAwid(), ucEnv.getDtoIn());
  }

  list(ucEnv) {
    return TripAbl.list(ucEnv.getUri().getAwid(), ucEnv.getDtoIn());
  }

  get(ucEnv) {
    return TripAbl.get(ucEnv.getUri().getAwid(), ucEnv.getDtoIn());
  }

  create(ucEnv) {
    return TripAbl.create(ucEnv.getUri().getAwid(), ucEnv.getDtoIn());
  }

  addRating(ucEnv) {
    return TripAbl.addRating(ucEnv.getUri().getAwid(), ucEnv.getDtoIn());
  }

}

module.exports = new TripController();
