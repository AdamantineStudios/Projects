"use strict";

const TravelAgencyUseCaseError = require("./travel-agency-use-case-error.js");
const LOCATION_ERROR_PREFIX = `${TravelAgencyUseCaseError.ERROR_PREFIX}location/`;

const Create = {
  UC_CODE: `${LOCATION_ERROR_PREFIX}create/`,

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

  LocationDaoCreateFailed: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Create.UC_CODE}locationDaoCreateFailed`;
      this.message = "Create location by Location DAO create failed.";
    }
  }

};

const Update = {
  UC_CODE: `${LOCATION_ERROR_PREFIX}update/`,

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

  LocationDaoGetFailed: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Update.UC_CODE}locationDaoGetFailed`;
      this.message = "Get location by Location DAO get failed.";
    }
  },

  LocationDaoUpdateFailed: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Update.UC_CODE}locationDaoUpdateFailed`;
      this.message = "Update location by Location DAO update failed.";
    }
  },

};

const Delete = {
  UC_CODE: `${LOCATION_ERROR_PREFIX}delete/`,

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

  LocationDaoGetFailed: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Delete.UC_CODE}locationDaoGetFailed`;
      this.message = "Get location by Location DAO get failed.";
    }
  },

  LocationContainsTrips: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Delete.UC_CODE}locationContainsTrips`;
      this.message = "Location already contains trips.";
    }
  },

  ParticipantDaoRemoveFailed: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Delete.UC_CODE}participantDaoRemoveFailed`;
      this.message = "Remove participant by Participant DAO remove failed.";
    }
  },

  TripRatingDaoRemoveFailed: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Delete.UC_CODE}tripRatingDaoRemoveFailed`;
      this.message = "Remove trip rating by TripRating DAO remove failed.";
    }
  },

  TripDaoRemoveFailed: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Delete.UC_CODE}tripDaoRemoveFailed`;
      this.message = "Remove trip by Trip DAO remove failed.";
    }
  },

  LocationDaoRemoveFailed: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Delete.UC_CODE}locationDaoRemoveFailed`;
      this.message = "Remove location by Location DAO remove failed.";
    }
  },

};

const List = {
  UC_CODE: `${LOCATION_ERROR_PREFIX}list/`,

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

const Get = {
  UC_CODE: `${LOCATION_ERROR_PREFIX}get/`,

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
      this.code = `${Get  .UC_CODE}travelAgencyNotInCorrectState`;
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

  LocationDaoGetFailed: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Get.UC_CODE}locationDaoGetFailed`;
      this.message = "Get location by Location DAO get failed.";
    }
  },


};

module.exports = {
  Get,
  List,
  Delete,
  Update,
  Create
};
