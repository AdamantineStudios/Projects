"use strict";
const { UuObjectDao } = require("uu_appg01_server").ObjectStore;

class ParticipantMongo extends UuObjectDao {

  async createSchema() {
    await super.createIndex({ awid: 1, _id: 1 }, { unique: true });
  }

  async create(uuObject) {
    return await super.insertOne(uuObject);
  }

  async get(awid, id) {
    let filter = {
      awid: awid,
      id: id
    };
    return await super.findOne(filter);
  }

  async list(awid, trip, pageInfo = {}) {
    let filter = {
      awid
    };
    if (trip) filter.trip = trip;
    return await super.find(filter, pageInfo);
  }

  async update(uuObject) {
    let filter = {
      awid: uuObject.awid,
      id: uuObject.id
    };
    return await super.findOneAndUpdate(filter, uuObject, "NONE");
  }

  async removeByTrip(awid, trip) {
    let filter = {
      awid,
      trip
    };
    return await super.deleteMany(filter);
  }

  async remove(uuObject) {
    let filter = {
      awid: uuObject.awid,
      id: uuObject.id
    };
    return await super.deleteOne(filter);
  }

}

module.exports = ParticipantMongo;
