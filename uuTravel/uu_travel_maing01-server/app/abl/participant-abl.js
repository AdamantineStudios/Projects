"use strict";
const Path = require("path");
const {Validator} = require("uu_appg01_server").Validation;
const {DaoFactory} = require("uu_appg01_server").ObjectStore;
const {ValidationHelper} = require("uu_appg01_server").AppServer;
const Errors = require("../api/errors/participant-error.js");

const WARNINGS = {
  createParticipantUnsupportedKeys: {
    code: `${Errors.Create.UC_CODE}unsupportedKeys`
  },
  getParticipantUnsupportedKeys: {
    code: `${Errors.Get.UC_CODE}unsupportedKeys`
  },
  listParticipantUnsupportedKeys: {
    code: `${Errors.List.UC_CODE}unsupportedKeys`
  },
  updateParticipantUnsupportedKeys: {
    code: `${Errors.Update.UC_CODE}unsupportedKeys`
  },
  deleteParticipantUnsupportedKeys: {
    code: `${Errors.Delete.UC_CODE}unsupportedKeys`
  }
};

const VALIDATION_TYPES = {
  createParticipant: "createParticipantDtoInType",
  getParticipant: "getParticipantDtoInType",
  listParticipant: "listParticipantDtoInType",
  updateParticipant: "updateParticipantDtoInType",
  deleteParticipant: "deleteParticipantDtoInType",
};

class ParticipantAbl {

  constructor() {
    this.validator = new Validator(Path.join(__dirname, "..", "api", "validation_types", "participant-types.js"));
    this.dao = DaoFactory.getDao("participant");
    this.tripDao = DaoFactory.getDao("trip");
    this.travelAgencyDao = DaoFactory.getDao("travelAgencyMain");
  }

  async create(awid, dtoIn, uuAppErrorMap = {}) {
    // HDS 1
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
      this.validator.validate(VALIDATION_TYPES.createParticipant, dtoIn),
      uuAppErrorMap,
      WARNINGS.createParticipantUnsupportedKeys.code,
      Errors.Create.InvalidDtoIn
    );

    // hds 3
    let trip = await this.tripDao.get(awid, dtoIn.trip);
    if (!trip) {
      throw new Errors.Create.TripDaoGetFailed({uuAppErrorMap}, {"dtoIn.trip": dtoIn.trip}); // A4
    }

    let participant;

    // hds 4
    try {
      participant = await this.dao.create({...dtoIn, awid});
    } catch (e) {
      throw new Errors.Create.ParticipantDaoCreateFailed({uuAppErrorMap}, {cause: e}); // A5
    }

    // hds 6
    return {
      participant,
      uuAppErrorMap
    }
  }

  async get(awid, dtoIn, uuAppErrorMap = {}) {
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
      this.validator.validate(VALIDATION_TYPES.getParticipant, dtoIn),
      uuAppErrorMap,
      WARNINGS.getParticipantUnsupportedKeys.code,
      Errors.Get.InvalidDtoIn
    );

    // hds 3
    let participant = await this.dao.get(awid, dtoIn.id);
    if (!participant) {
      throw new Errors.Create.ParticipantDaoCreateFailed(
        {uuAppErrorMap}, {"dtoIn.participant": dtoIn.participant}
      ); // A5
    }

    // hds 4
    return {
      participant,
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
      throw new Errors.Create.TravelAgencyNotInCorrectState({ uuAppErrorMap }, { state: travelAgency.state }); // A2
    }

    // hds 2
    // A3, A4
    ValidationHelper.processValidationResult(
      dtoIn,
      this.validator.validate(VALIDATION_TYPES.listParticipant, dtoIn),
      uuAppErrorMap,
      WARNINGS.listParticipantUnsupportedKeys.code,
      Errors.List.InvalidDtoIn
    );

    // hds 3
    let {
      itemList,
      pageInfo
    } = await this.dao.list(awid, null, dtoIn.pageInfo);

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
      throw new Errors.Create.TravelAgencyNotInCorrectState({ uuAppErrorMap }, { state: travelAgency.state }); // A2
    }

    // hds 2
    // A3, A4
    ValidationHelper.processValidationResult(
      dtoIn,
      this.validator.validate(VALIDATION_TYPES.updateParticipant, dtoIn),
      uuAppErrorMap,
      WARNINGS.updateParticipantUnsupportedKeys.code,
      Errors.Update.InvalidDtoIn
    );

    // hds 3
    let participant = await this.dao.get(awid, dtoIn.id);
    if (!participant) {
      throw new Errors.Update.ParticipantDaoGetFailed(
        {uuAppErrorMap}, {"dtoIn.participant": dtoIn.participant}
      ); // A5
    }

    // hds 4
    if (dtoIn.trip) {
      let trip = await this.tripDao.get(awid, dtoIn.trip);
      if (!trip) {
        throw new Errors.Update.TripDaoGetFailed({uuAppErrorMap}, {"dtoIn.trip": dtoIn.trip}); // A6
      }
    }

    // hds 5
    ["firstName", "lastName", "email", "trip"].map((key) => {
      if (dtoIn.hasOwnProperty(key)) participant[key] = dtoIn[key];
    });

    // hds 6
    return {
      participant,
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
      throw new Errors.Create.TravelAgencyNotInCorrectState({ uuAppErrorMap }, { state: travelAgency.state }); // A2
    }

    // hds 2
    // A3, A4
    ValidationHelper.processValidationResult(
      dtoIn,
      this.validator.validate(VALIDATION_TYPES.deleteParticipant, dtoIn),
      uuAppErrorMap,
      WARNINGS.deleteParticipantUnsupportedKeys.code,
      Errors.Delete.InvalidDtoIn
    );

    // hds 3
    let participant = await this.dao.get(awid, dtoIn.id);
    if (!participant) {
      throw new Errors.Delete.ParticipantDaoGetFailed(
        {uuAppErrorMap}, {"dtoIn.participant": dtoIn.participant}
      ); // A5
    }

    // hds 4
    try {
      await this.dao.remove(participant)
    } catch (e) {
      throw new Errors.Delete.ParticipantDaoRemoveFailed({uuAppErrorMap}, {cause: e}); // A6
    }

    // hds 5
    return {
      uuAppErrorMap
    }
  }

}

module.exports = new ParticipantAbl();
