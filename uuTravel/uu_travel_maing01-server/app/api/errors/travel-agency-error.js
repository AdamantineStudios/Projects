"use strict";
const TravelAgencyUseCaseError = require("./travel-agency-use-case-error.js");

const Init = {
  UC_CODE: `${TravelAgencyUseCaseError.ERROR_PREFIX}init/`,

  InvalidDtoIn: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Init.UC_CODE}invalidDtoIn`;
      this.message = "DtoIn is not valid.";
    }
  },

  TravelAgencyAlreadyInitialized: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Init.UC_CODE}travelAgencyAlreadyInitialized`;
      this.message = "Travel agency is already initialized.";
    }
  },

  SchemaDaoCreateSchemaFailed: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.status = 500;
      this.code = `${Init.UC_CODE}schemaDaoCreateSchemaFailed`;
      this.message = "Create schema by Dao createSchema failed.";
    }
  },

  SetProfileFailed: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Init.UC_CODE}sys/setProfileFailed`;
      this.message = "Set profile failed.";
    }
  },

  TravelAgencyDaoCreateFailed: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Init.UC_CODE}travelAgencyDaoCreateFailed`;
      this.message = "Create travel agency by TravelAgency DAO failed.";
    }
  }
};

const Get = {
  UC_CODE: `${TravelAgencyUseCaseError.ERROR_PREFIX}get/`,

  TravelAgencyNotInitialized: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Get.UC_CODE}travelAgencyNotInitialized`;
      this.message = "Travel agency not initialized.";
    }
  },

};

const Update = {
  UC_CODE: `${TravelAgencyUseCaseError.ERROR_PREFIX}update/`,

  InvalidDtoIn: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Update.UC_CODE}invalidDtoIn`;
      this.message = "DtoIn is not valid.";
    }
  },

  TravelAgencyNotInitialized: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Update.UC_CODE}travelAgencyNotInitialized`;
      this.message = "Travel agency not initialized.";
    }
  },

  TravelAgencyDaoUpdateFailed: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Update.UC_CODE}travelAgencyDaoUpdateFailed`;
      this.message = "Update travel agency by TravelAgency DAO update failed.";
    }
  }
};

module.exports = {
  Init,
  Get,
  Update
};
