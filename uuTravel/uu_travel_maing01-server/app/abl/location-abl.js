"use strict";
const Path = require("path");
const {Validator} = require("uu_appg01_server").Validation;
const {DaoFactory} = require("uu_appg01_server").ObjectStore;
const {ValidationHelper} = require("uu_appg01_server").AppServer;
const Errors = require("../api/errors/location-error.js");

const WARNINGS = {
  createLocationUnsupportedKeys: {
    code: `${Errors.Create.UC_CODE}unsupportedKeys`
  },
  getLocationUnsupportedKeys: {
    code: `${Errors.Get.UC_CODE}unsupportedKeys`
  },
  listLocationUnsupportedKeys: {
    code: `${Errors.List.UC_CODE}unsupportedKeys`
  },
  updateLocationUnsupportedKeys: {
    code: `${Errors.Update.UC_CODE}unsupportedKeys`
  },
  deleteLocationUnsupportedKeys: {
    code: `${Errors.Update.UC_CODE}unsupportedKeys`
  }
};

const VALIDATION_TYPES = {
  createLocation: "locationCreateDtoInType",
  getLocation: "locationGetDtoInType",
  listLocation: "locationListDtoInType",
  updateLocation: "locationUpdateDtoInType",
  deleteLocation: "locationDeleteDtoInType",
};

class LocationAbl {

  constructor() {
    this.validator = new Validator(Path.join(__dirname, "..", "api", "validation_types", "location-types.js"));
    this.dao = DaoFactory.getDao("location");
    this.tripDao = DaoFactory.getDao("trip");
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
      throw new Errors.Create.TravelAgencyNotInCorrectState({ uuAppErrorMap }, { state: travelAgency.state }); // A2
    }

    // hds 2
    // A3, A4
    ValidationHelper.processValidationResult(
      dtoIn,
      this.validator.validate(VALIDATION_TYPES.createLocation, dtoIn),
      uuAppErrorMap,
      WARNINGS.createLocationUnsupportedKeys.code,
      Errors.Create.InvalidDtoIn
    );

    let location;

    // hds 3
    try {
      location = await this.dao.create({...dtoIn, awid});
    } catch (e) {
      throw new Errors.Create.LocationDaoCreateFailed({uuAppErrorMap}, {cause: e}); // A5
    }

    // hds 4
    return {
      location,
      uuAppErrorMap
    };
  }

  async get(awid, dtoIn, uuAppErrorMap = {}) {
    // HDS 1
    let travelAgency = await this.travelAgencyDao.get(awid);
    if (!travelAgency) {
      // A1
      throw new Errors.Get.TravelAgencyNotInitialized({uuAppErrorMap}, {awid});
    }

    if (travelAgency.state !== "active") {
      throw new Errors.Get.TravelAgencyNotInCorrectState({ uuAppErrorMap }, { state: travelAgency.state }); // A2
    }

    // hds 2
    // A3, A4
    ValidationHelper.processValidationResult(
      dtoIn,
      this.validator.validate(VALIDATION_TYPES.getLocation, dtoIn),
      uuAppErrorMap,
      WARNINGS.getLocationUnsupportedKeys.code,
      Errors.Get.InvalidDtoIn
    );

    // hds 3
    let location = await this.dao.get(awid, dtoIn.id);
    if (!location) {
      throw new Errors.Get.LocationDaoGetFailed({uuAppErrorMap}, {"dtoIn.id": dtoIn.id}); // A5
    }

    // hds 4
    return {
      location,
      uuAppErrorMap
    };
  }

  async list(awid, dtoIn, uuAppErrorMap = {}) {
    // HDS 1
    let travelAgency = await this.travelAgencyDao.get(awid);
    if (!travelAgency) {
      // A1
      throw new Errors.List.TravelAgencyNotInitialized({uuAppErrorMap}, {awid});
    }

    if (travelAgency.state !== "active") {
      throw new Errors.List.TravelAgencyNotInCorrectState({ uuAppErrorMap }, { state: travelAgency.state }); // A2
    }

    // hds 2
    // A3, A4
    ValidationHelper.processValidationResult(
      dtoIn,
      this.validator.validate(VALIDATION_TYPES.listLocation, dtoIn),
      uuAppErrorMap,
      WARNINGS.listLocationUnsupportedKeys.code,
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
    // HDS 1
    let travelAgency = await this.travelAgencyDao.get(awid);
    if (!travelAgency) {
      // A1
      throw new Errors.Update.TravelAgencyNotInitialized({uuAppErrorMap}, {awid});
    }

    if (travelAgency.state !== "active") {
      throw new Errors.Update.TravelAgencyNotInCorrectState({ uuAppErrorMap }, { state: travelAgency.state }); // A2
    }

    // hds 2
    // A3, A4
    ValidationHelper.processValidationResult(
      dtoIn,
      this.validator.validate(VALIDATION_TYPES.updateLocation, dtoIn),
      uuAppErrorMap,
      WARNINGS.updateLocationUnsupportedKeys.code,
      Errors.Update.InvalidDtoIn
    );

    // hds 3
    let location = await this.dao.get(awid, dtoIn.id);
    if (!location) {
      throw new Errors.Update.LocationDaoGetFailed({uuAppErrorMap}, {"dtoIn.id": dtoIn.id}); // A5
    }

    // hds 4
    let locationKeys = ["name", "country", "city", "street", "zipCode", "capacity"];
    locationKeys.map((key) => {
      if (dtoIn.hasOwnProperty(key)) location[key] = dtoIn[key];
    });

    // hds 5
    try {
      location = await this.dao.update(location);
    } catch (e) {
      throw new Errors.Update.LocationDaoUpdateFailed({uuAppErrorMap}, {cause: e}); // A6
    }

    // hds 6
    return {
      location,
      uuAppErrorMap
    };
  }

  async delete(awid, dtoIn, uuAppErrorMap = {}) {
    // HDS 1
    let travelAgency = await this.travelAgencyDao.get(awid);
    if (!travelAgency) {
      // A1
      throw new Errors.Delete.TravelAgencyNotInitialized({uuAppErrorMap}, {awid});
    }

    if (travelAgency.state !== "active") {
      throw new Errors.Delete.TravelAgencyNotInCorrectState({ uuAppErrorMap }, { state: travelAgency.state }); // A2
    }

    // hds 2
    // A3, A4
    ValidationHelper.processValidationResult(
      dtoIn,
      this.validator.validate(VALIDATION_TYPES.deleteLocation, dtoIn),
      uuAppErrorMap,
      WARNINGS.deleteLocationUnsupportedKeys.code,
      Errors.Delete.InvalidDtoIn
    );

    // hds 3
    let location = await this.dao.get(awid, dtoIn.id);
    if (!location) {
      throw new Errors.Delete.LocationDaoGetFailed({uuAppErrorMap}, {"dtoIn.id": dtoIn.id}); // A5
    }

    // hds 4
    let locationTrips = await this.tripDao.listByLocation(awid, dtoIn.id);
    if (locationTrips.itemList.length > 0 && !dtoIn.force) {
      throw new Errors.Delete.LocationContainsTrips(
        {uuAppErrorMap}, {"locationTrips.length": locationTrips.itemList.length}
      ); // A6
    }

    // hds 5
    let trips = locationTrips.itemList.map((trip) => trip.id.toString());
    for (let tripId of trips) {
      // hds 4.1
      try {
        await this.participantDao.removeByTrip(awid, tripId);
      } catch (e) {
        throw new Errors.Delete.ParticipantDaoRemoveFailed({uuAppErrorMap}, {cause: e}); // A7
      }
    }

    // hds 6
    for (let trip of locationTrips.itemList) {
      try {
        await this.tripDao.remove(trip);
      } catch (e) {
        throw new Errors.Delete.TripDaoDeleteFailed({uuAppErrorMap}, {cause: e}); // A8
      }
    }

    // hds 7
    try {
      await this.dao.remove(location);
    } catch (e) {
      throw new Errors.Delete.LocationDaoRemoveFailed({uuAppErrorMap}, {cause: e}); // A9
    }

    // hds 8
    return {
      uuAppErrorMap
    };
  }

}

module.exports = new LocationAbl();
