"use strict";

const TravelAgencyUseCaseError = require("./travel-agency-use-case-error.js");
const TRIP_ERROR_PREFIX = `${TravelAgencyUseCaseError.ERROR_PREFIX}trip/`;

const Create = {
  UC_CODE: `${TRIP_ERROR_PREFIX}create/`,

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

  LocationDaoGetFailed: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Create.UC_CODE}locationDaoGetFailed`;
      this.message = "Get location by Location DAO get failed.";
    }
  },

  NotEnoughSpaceInLocation: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Create.UC_CODE}notEnoughSpaceInLocation`;
      this.message = "Not enough space in location.";
    }
  },

  TripDaoCreateFailed: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Create.UC_CODE}tripDaoCreateFailed`;
      this.message = "Create trip by Trip DAO create failed.";
    }
  },

};

const Get = {
  UC_CODE: `${TRIP_ERROR_PREFIX}get/`,

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

  TripDaoGetFailed: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Get.UC_CODE}tripDaoGetFailed`;
      this.message = "Get trip by Trip DAO get failed.";
    }
  },
};

const List = {
  UC_CODE: `${TRIP_ERROR_PREFIX}list/`,

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
  UC_CODE: `${TRIP_ERROR_PREFIX}update/`,

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

  TripDaoGetFailed: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Update.UC_CODE}tripDaoGetFailed`;
      this.message = "Get trip by Trip DAO get failed.";
    }
  },

  LocationDaoGetFailed: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Update.UC_CODE}locationDaoGetFailed`;
      this.message = "Get location by Location DAO get failed.";
    }
  },

  NotEnoughSpaceInLocation: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Update.UC_CODE}notEnoughSpaceInLocation`;
      this.message = "Not enough space in location.";
    }
  },

  TripDaoUpdateFailed: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Update.UC_CODE}tripDaoUpdateFailed`;
      this.message = "Update trip by Trip DAO update failed.";
    }
  },

};

const Delete = {
  UC_CODE: `${TRIP_ERROR_PREFIX}delete/`,

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

  TripDaoGetFailed: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Delete.UC_CODE}tripDaoGetFailed`;
      this.message = "Get trip by Trip DAO get failed.";
    }
  },

  TripContainsParticipant: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Delete.UC_CODE}tripContainsParticipant`;
      this.message = "Trip already contains participants.";
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

  TripDaoDeleteFailed: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${Delete.UC_CODE}tripDaoDeleteFailed`;
      this.message = "Delete trip by Trip DAO delete failed.";
    }
  },

};

const AddRating = {
  UC_CODE: `${TRIP_ERROR_PREFIX}addRating/`,

  TravelAgencyNotInitialized: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${AddRating.UC_CODE}travelAgencyNotInitialized`;
      this.message = "Travel agency not initialized.";
    }
  },

  TravelAgencyNotInCorrectState: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${AddRating.UC_CODE}travelAgencyNotInCorrectState`;
      this.message = "Travel agency not in correct state [active].";
    }
  },

  InvalidDtoIn: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${AddRating.UC_CODE}invalidDtoIn`;
      this.message = "DtoIn is not valid.";
    }
  },

  TripDaoGetFailed: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${AddRating.UC_CODE}tripDaoGetFailed`;
      this.message = "Get trip by Trip DAO get failed.";
    }
  },

  ParticipantDaoGetFailed: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${AddRating.UC_CODE}ParticipantDaoGetFailed`;
      this.message = "Get participant by Participant DAO get failed.";
    }
  },

  TripDaoUpdateFailed: class extends TravelAgencyUseCaseError {
    constructor() {
      super(...arguments);
      this.code = `${AddRating.UC_CODE}tripDaoUpdateFailed`;
      this.message = "Update trip by Trip DAO update failed.";
    }
  },

};

module.exports = {
  Create,
  Delete,
  Update,
  List,
  Get,
  AddRating
};
