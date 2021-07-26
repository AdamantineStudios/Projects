"use strict";

const TravelAgencyUseCaseError = require("./travel-agency-use-case-error.js");
const PARTICIPANT_ERROR_PREFIX = `${TravelAgencyUseCaseError.ERROR_PREFIX}participant/`;

const Create = {
  UC_CODE: `${PARTICIPANT_ERROR_PREFIX}create/`,

  TravelAgencyNotInitialized: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Create.UC_CODE}travelAgencyNotInitialized`;
      this.message = "Travel agency not initialized.";
    }
  },

  TravelAgencyNotInCorrectState: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Create.UC_CODE}travelAgencyNotInCorrectState`;
      this.message = "Travel agency not in correct state [active].";
    }
  },

  InvalidDtoIn: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Create.UC_CODE}invalidDtoIn`;
      this.message = "DtoIn is not valid.";
    }
  },

  TripDaoGetFailed: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Create.UC_CODE}tripDaoGetFailed`;
      this.message = "Get trip by Trip DAO create failed.";
    }
  },

  ParticipantDaoCreateFailed: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Create.UC_CODE}participantDaoCreateFailed`;
      this.message = "Create participant by Participant DAO create failed.";
    }
  }

};

const Get = {
  UC_CODE: `${PARTICIPANT_ERROR_PREFIX}get/`,

  TravelAgencyNotInitialized: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Get.UC_CODE}travelAgencyNotInitialized`;
      this.message = "Travel agency not initialized.";
    }
  },

  TravelAgencyNotInCorrectState: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Get.UC_CODE}travelAgencyNotInCorrectState`;
      this.message = "Travel agency not in correct state [active].";
    }
  },

  InvalidDtoIn: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Get.UC_CODE}invalidDtoIn`;
      this.message = "DtoIn is not valid.";
    }
  },

  ParticipantDaoGetFailed: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Get.UC_CODE}participantDaoGetFailed`;
      this.message = "Get participant by Participant DAO get failed.";
    }
  },

};

const List = {
  UC_CODE: `${PARTICIPANT_ERROR_PREFIX}list/`,

  TravelAgencyNotInitialized: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${List.UC_CODE}travelAgencyNotInitialized`;
      this.message = "Travel agency not initialized.";
    }
  },

  TravelAgencyNotInCorrectState: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${List.UC_CODE}travelAgencyNotInCorrectState`;
      this.message = "Travel agency not in correct state [active].";
    }
  },

  InvalidDtoIn: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${List.UC_CODE}invalidDtoIn`;
      this.message = "DtoIn is not valid.";
    }
  },
};

const Update = {
  UC_CODE: `${PARTICIPANT_ERROR_PREFIX}update/`,

  TravelAgencyNotInitialized: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Update.UC_CODE}travelAgencyNotInitialized`;
      this.message = "Travel agency not initialized.";
    }
  },

  TravelAgencyNotInCorrectState: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Update.UC_CODE}travelAgencyNotInCorrectState`;
      this.message = "Travel agency not in correct state [active].";
    }
  },

  InvalidDtoIn: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Update.UC_CODE}invalidDtoIn`;
      this.message = "DtoIn is not valid.";
    }
  },

  ParticipantDaoGetFailed: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Update.UC_CODE}participantDaoGetFailed`;
      this.message = "Get participant by Participant DAO get failed.";
    }
  },

  TripDaoGetFailed: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Update.UC_CODE}tripDaoGetFailed`;
      this.message = "Get trip by Trip DAO create failed.";
    }
  },

};

const Delete = {
  UC_CODE: `${PARTICIPANT_ERROR_PREFIX}delete/`,

  TravelAgencyNotInitialized: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Delete.UC_CODE}travelAgencyNotInitialized`;
      this.message = "Travel agency not initialized.";
    }
  },

  TravelAgencyNotInCorrectState: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Delete.UC_CODE}travelAgencyNotInCorrectState`;
      this.message = "Travel agency not in correct state [active].";
    }
  },

  InvalidDtoIn: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Delete.UC_CODE}invalidDtoIn`;
      this.message = "DtoIn is not valid.";
    }
  },

  ParticipantDaoGetFailed: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Delete.UC_CODE}participantDaoGetFailed`;
      this.message = "Get participant by Participant DAO get failed.";
    }
  },
};

module.exports = {
  Delete,
  Update,
  List,
  Get,
  Create
};
