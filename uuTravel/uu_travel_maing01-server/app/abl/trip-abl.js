"use strict";
const Path = require("path");
const {Validator} = require("uu_appg01_server").Validation;
const {DaoFactory} = require("uu_appg01_server").ObjectStore;
const {ValidationHelper} = require("uu_appg01_server").AppServer;
const Errors = require("../api/errors/trip-error.js");

const WARNINGS = {
  createTripUnsupportedKeys: {
    code: `${Errors.Create.UC_CODE}unsupportedKeys`
  },
  getTripUnsupportedKeys: {
    code: `${Errors.Get.UC_CODE}unsupportedKeys`
  },
  listTripUnsupportedKeys: {
    code: `${Errors.List.UC_CODE}unsupportedKeys`
  },
  updateTripUnsupportedKeys: {
    code: `${Errors.Update.UC_CODE}unsupportedKeys`
  },
  deleteTripUnsupportedKeys: {
    code: `${Errors.Delete.UC_CODE}unsupportedKeys`
  },
  addRatingUnsupportedKeys: {
    code: `${Errors.AddRating.UC_CODE}unsupportedKeys`
  }
};

const VALIDATION_TYPES = {
  createTrip: "createTripDtoInType",
  getTrip: "getTripDtoInType",
  listTrip: "listTripDtoInType",
  updateTrip: "updateTripDtoInType",
  deleteTrip: "deleteTripDtoInType",
  addRating: "addRatingDtoInType"
};

class TripAbl {

  constructor() {
    this.validator = new Validator(Path.join(__dirname, "..", "api", "validation_types", "trip-types.js"));
    this.dao = DaoFactory.getDao("trip");
    this.locationDao = DaoFactory.getDao("location");
    this.participantDao = DaoFactory.getDao("participant");
    this.travelAgencyDao = DaoFactory.getDao("travelAgencyMain");
  }

  async create(awid, dtoIn, uuAppErrorMap = {}) {
    // hds 1
    let travelAgency = await this.travelAgencyDao.get(awid);
    if (!travelAgency) {
      // A1
      throw new Errors.Create.TravelAgencyNotInitialized({uuAppErrorMap}, {awid});
    }

    if (travelAgency.state !== "active") {
      throw new Errors.Create.TravelAgencyNotInCorrectState({uuAppErrorMap}, {state: travelAgency.state}); // A2
    }

    // hds 2
    // A3, A4
    ValidationHelper.processValidationResult(
      dtoIn,
      this.validator.validate(VALIDATION_TYPES.createTrip, dtoIn),
      uuAppErrorMap,
      WARNINGS.createTripUnsupportedKeys.code,
      Errors.Create.InvalidDtoIn
    );

    // hds 3
    let location = await this.locationDao.get(awid, dtoIn.location);
    if (!location) {
      throw new Errors.Create.LocationDaoGetFailed({uuAppErrorMap}, {"dtoIn.location": dtoIn.location}); // A5
    }

    if (dtoIn.capacity > location.capacity) {
      throw new Errors.Create.NotEnoughSpaceInLocation(
        {uuAppErrorMap},
        {
          "dtoIn.capacity": dtoIn.capacity,
          "location.capacity": location.capacity
        }
      ); // A6
    }

    dtoIn.awid = awid;
    dtoIn.startDate = new Date(dtoIn.startDate).toISOString();
    dtoIn.endDate = new Date(dtoIn.endDate).toISOString();

    let trip;

    // hds 4
    try {
      trip = await this.dao.create({...dtoIn, awid});
    } catch (e) {
      throw new Errors.Create.TripDaoCreateFailed({uuAppErrorMap}, {cause: e}); // A7
    }

    // hds 5
    return {
      trip,
      uuAppErrorMap
    };
  }

  async get(awid, dtoIn, uuAppErrorMap = {}) {
    // hds 1
    let travelAgency = await this.travelAgencyDao.get(awid);
    if (!travelAgency) {
      // A1
      throw new Errors.Get.TravelAgencyNotInitialized({uuAppErrorMap}, {awid});
    }

    if (travelAgency.state !== "active") {
      throw new Errors.Get.TravelAgencyNotInCorrectState({uuAppErrorMap}, {state: travelAgency.state}); // A2
    }

    // hds 2
    // A3, A4
    ValidationHelper.processValidationResult(
      dtoIn,
      this.validator.validate(VALIDATION_TYPES.getTrip, dtoIn),
      uuAppErrorMap,
      WARNINGS.getTripUnsupportedKeys.code,
      Errors.Get.InvalidDtoIn
    );

    // hds 3
    let trip = await this.dao.get(awid, dtoIn.id);
    if (!trip) {
      throw new Errors.Get.TripDaoGetFailed({uuAppErrorMap}, {"dtoIn.id": dtoIn.id}); // A5
    }

    // hds 4
    return {
      trip,
      uuAppErrorMap
    }
  }

  async list(awid, dtoIn, uuAppErrorMap = {}) {
    // hds 1
    let travelAgency = await this.travelAgencyDao.get(awid);
    if (!travelAgency) {
      // A1
      throw new Errors.Create.TravelAgencyNotInitialized({uuAppErrorMap}, {awid});
    }

    if (travelAgency.state !== "active") {
      throw new Errors.Create.TravelAgencyNotInCorrectState({uuAppErrorMap}, {state: travelAgency.state}); // A2
    }

    // hds 2
    // A3, A4
    ValidationHelper.processValidationResult(
      dtoIn,
      this.validator.validate(VALIDATION_TYPES.listTrip, dtoIn),
      uuAppErrorMap,
      WARNINGS.listTripUnsupportedKeys.code,
      Errors.List.InvalidDtoIn
    );

    // hds 3
    let {
      itemList,
      pageInfo
    } = await this.dao.list(awid, dtoIn.pageInfo);

    // hds 4
    return {
      itemList,
      pageInfo,
      uuAppErrorMap
    };
  }

  async update(awid, dtoIn, uuAppErrorMap = {}) {
    // hds 1
    let travelAgency = await this.travelAgencyDao.get(awid);
    if (!travelAgency) {
      // A1
      throw new Errors.Create.TravelAgencyNotInitialized({uuAppErrorMap}, {awid});
    }

    if (travelAgency.state !== "active") {
      throw new Errors.Create.TravelAgencyNotInCorrectState({uuAppErrorMap}, {state: travelAgency.state}); // A2
    }

    // hds 2
    // A2, A3
    ValidationHelper.processValidationResult(
      dtoIn,
      this.validator.validate(VALIDATION_TYPES.updateTrip, dtoIn),
      uuAppErrorMap,
      WARNINGS.updateTripUnsupportedKeys.code,
      Errors.Update.InvalidDtoIn
    );

    // hds 3
    let trip = await this.dao.get(awid, dtoIn.id);
    if (!trip) {
      throw new Errors.Update.TripDaoGetFailed({uuAppErrorMap}, {"dtoIn.id": dtoIn.id}); // A4
    }

    if (dtoIn.location) {
      // hds 4
      let location = await this.locationDao.get(awid, dtoIn.location);
      if (!location) {
        throw new Errors.Update.LocationDaoGetFailed({uuAppErrorMap}, {"dtoIn.location": dtoIn.location}); // A5
      }

      if (dtoIn.capacity > location.capacity) {
        throw new Errors.Update.NotEnoughSpaceInLocation(
          {uuAppErrorMap},
          {
            "dtoIn.capacity": dtoIn.capacity,
            "location.capacity": location.capacity
          }
        ); // A6
      }
    }

    // hds 5
    ["name", "description", "capacity", "startDate", "endDate", "location"].map((key) => {
      if (dtoIn.hasOwnProperty(key)) trip[key] = dtoIn[key];
    });

    // hds 6
    try {
      trip = await this.dao.update(trip);
    } catch (e) {
      throw new Errors.Update.TravelAgencyDaoUpdateFailed({uuAppErrorMap}, {cause: e})
    }

    // hds 7
    return {
      trip,
      uuAppErrorMap
    };
  }

  async delete(awid, dtoIn, uuAppErrorMap = {}) {
    // hds 1
    let travelAgency = await this.travelAgencyDao.get(awid);
    if (!travelAgency) {
      // A1
      throw new Errors.Create.TravelAgencyNotInitialized({uuAppErrorMap}, {awid});
    }

    if (travelAgency.state !== "active") {
      throw new Errors.Create.TravelAgencyNotInCorrectState({uuAppErrorMap}, {state: travelAgency.state}); // A2
    }

    // hds 2
    // A3, A4
    ValidationHelper.processValidationResult(
      dtoIn,
      this.validator.validate(VALIDATION_TYPES.deleteTrip, dtoIn),
      uuAppErrorMap,
      WARNINGS.deleteTripUnsupportedKeys.code,
      Errors.Delete.InvalidDtoIn
    );

    // hds 3
    let trip = await this.dao.get(awid, dtoIn.id);
    if (!trip) {
      throw new Errors.Delete.TripDaoGetFailed({uuAppErrorMap}, {"dtoIn.id": dtoIn.id}); // A5
    }

    // hds 4
    let tripParticipants = await this.participantDao.list(awid, dtoIn.id);
    if (tripParticipants.itemList.length > 0 && !dtoIn.force) {
      throw new Errors.Delete.TripContainsParticipant(
        {uuAppErrorMap}, {"tripParticipants.length": tripParticipants.itemList.length}
      ); // A6
    }

    // hds 5
    try {
      await this.participantDao.removeByTrip(awid, dtoIn.id);
    } catch (e) {
      throw new Errors.Delete.ParticipantDaoRemoveFailed({uuAppErrorMap}, {cause: e}); // A7
    }

    // hds 6
    try {
      await this.dao.remove(trip);
    } catch (e) {
      throw new Errors.Delete.TripDaoDeleteFailed({uuAppErrorMap}, {cause: e}); // A8
    }

    // hds 7
    return {
      uuAppErrorMap
    };
  }

  async addRating(awid, dtoIn, uuAppErrorMap = {}) {
    // hds 1
    let travelAgency = await this.travelAgencyDao.get(awid);
    if (!travelAgency) {
      // A1
      throw new Errors.Create.TravelAgencyNotInitialized({uuAppErrorMap}, {awid});
    }

    if (travelAgency.state !== "active") {
      throw new Errors.Create.TravelAgencyNotInCorrectState({uuAppErrorMap}, {state: travelAgency.state}); // A2
    }

    // hds 2
    // A3, A4
    ValidationHelper.processValidationResult(
      dtoIn,
      this.validator.validate(VALIDATION_TYPES.addRating, dtoIn),
      uuAppErrorMap,
      WARNINGS.addRatingUnsupportedKeys.code,
      Errors.Delete.InvalidDtoIn
    );

    // hds 3
    let trip = await this.dao.get(awid, dtoIn.id);
    if (!trip) {
      throw new Errors.AddRating.TripDaoGetFailed({uuAppErrorMap}, {"dtoIn.id": dtoIn.id}); // A5
    }

    // hds 4
    let participant = await this.participantDao.get(awid, dtoIn.participant);
    if (!participant) {
      throw new Errors.AddRating.ParticipantDaoGetFailed(
        {uuAppErrorMap}, {"dtoIn.participant": dtoIn.participant}
      ); // A6
    }

    // hds 5
    if (!trip.hasOwnProperty("participantList")) trip.participantList = [];

    // hds 6
    trip.participantList.push({
      participant: dtoIn.participant,
      rating: dtoIn.rating,
      comment: dtoIn.comment ? dtoIn.comment : null
    });

    // hds 7
    try {
      trip = await this.dao.update(trip);
    } catch (e) {
      throw new Errors.AddRating.TripDaoUpdateFailed({uuAppErrorMap}, {cause: e}); // A7
    }

    // hds 8
    return {
      trip,
      uuAppErrorMap
    }
  }

}

module.exports = new TripAbl();
