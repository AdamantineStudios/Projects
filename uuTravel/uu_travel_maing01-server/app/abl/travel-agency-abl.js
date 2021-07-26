"use strict";
const {Validator} = require("uu_appg01_server").Validation;
const {DaoFactory, ObjectStoreError} = require("uu_appg01_server").ObjectStore;
const {ValidationHelper} = require("uu_appg01_server").AppServer;
const {SysProfileModel} = require("uu_appg01_server").Workspace;
const Errors = require("../api/errors/travel-agency-error.js");

const WARNINGS = {
  initUnsupportedKeys: {
    code: `${Errors.Init.UC_CODE}unsupportedKeys`
  },
  updateUnsupportedKeys: {
    code: `${Errors.Update.UC_CODE}unsupportedKeys`
  }
};

const VALIDATION_TYPES = {
  init: "initDtoInType",
  update: "updateDtoInType",
  load: "loadDtoInType"
};

class TravelAgencyAbl {
  constructor() {
    this.validator = Validator.load();
    this.dao = DaoFactory.getDao("travelAgencyMain")
  }

  async init(awid, dtoIn, uuAppErrorMap = {}) {
    // HDS 1
    let travelAgency = await this.dao.get(awid);
    if (travelAgency) {
      // A1
      throw new Errors.Init.TravelAgencyAlreadyInitialized({uuAppErrorMap}, {awid});
    }

    // HDS 2
    let validationResult = this.validator.validate(VALIDATION_TYPES.init, dtoIn);
    // A2, A3
    ValidationHelper.processValidationResult(
      dtoIn,
      validationResult,
      uuAppErrorMap,
      WARNINGS.initUnsupportedKeys.code,
      Errors.Init.InvalidDtoIn
    );

    // HDS 3
    const schemas = ["travelAgencyMain", "trip", "location", "participant"];
    let schemaCreateResults = schemas.map(async schema => {
      try {
        return await DaoFactory.getDao(schema).createSchema();
      } catch (e) {
        // A3
        throw new Errors.Init.SchemaDaoCreateSchemaFailed({uuAppErrorMap}, {schema}, e);
      }
    });
    await Promise.all(schemaCreateResults);

    // HDS 4
    try {
      await SysProfileModel.setProfile(awid, {code: "Authorities", roleUri: dtoIn.authoritiesUri});
    } catch (e) {
      if (e instanceof ObjectStoreError) {
        // A4
        throw new Errors.Init.SetProfileFailed({uuAppErrorMap}, {role: dtoIn.authoritiesUri}, e);
      }
      throw e;
    }

    dtoIn = {
      ...dtoIn,
      awid,
      state: "active",
      name: dtoIn.name ? dtoIn.name : null
    };

    // HDS 5
    try {
      travelAgency = await this.dao.create(dtoIn);
    } catch (e) {
      // A5
      throw new Errors.Init.TravelAgencyDaoCreateFailed({uuAppErrorMap}, {cause: e});
    }

    // HDS 6
    return {
      travelAgency,
      uuAppErrorMap
    };
  }

  async load(awid, uuAppErrorMap = {}) {
    // HDS 1
    let travelAgency = await this.dao.get(awid);
    if (!travelAgency) {
      // A1
      throw new Errors.Get.TravelAgencyNotInitialized({uuAppErrorMap}, {awid});
    }

    // HDS 2
    return {
      travelAgency,
      uuAppErrorMap
    }
  }

  async update(awid, dtoIn, uuAppErrorMap = {}) {
    // HDS 1, A2, A3
    ValidationHelper.processValidationResult(
      dtoIn,
      this.validator.validate(VALIDATION_TYPES.update, dtoIn),
      uuAppErrorMap,
      WARNINGS.updateUnsupportedKeys.code,
      Errors.Update.InvalidDtoIn
    );

    // HDS 2
    let travelAgency = await this.dao.get(awid);
    if (!travelAgency) {
      // A4
      throw new Errors.Get.TravelAgencyNotInitialized({uuAppErrorMap}, {awid});
    }

    // HDS 3
    ["state", "name"].map((key) => {
      if (dtoIn.hasOwnProperty(key)) travelAgency[key] = dtoIn[key];
    });

    // HDS 4
    try {
      travelAgency = await this.dao.update(travelAgency);
    } catch (e) {
      throw new Errors.Update.TravelAgencyDaoUpdateFailed({uuAppErrorMap}, {cause: e}); // A5
    }

    // HDS 5
    return {
      travelAgency,
      uuAppErrorMap
    };
  }
}

module.exports = new TravelAgencyAbl();
