//@@viewOn:imports
import UU5 from "uu5g04";
import Calls from "calls";
import { createComponent, useState } from "uu5g04-hooks";
import Config from "../config/config";
//@@viewOff:imports

let initialTrips = [
  {
    id: 1,
    name: "Trip 1",
    description: "This is my Trip 1...",
    capacity: 50,
    startDate: "15.02.2020",
    endDate: "15.04.2020",
    location: "New York",
  },
  {
    id: 2,
    name: "Trip 2",
    description: "This is my Trip 2...",
    capacity: 50,
    startDate: "18.02.2020",
    endDate: "18.04.2020",
    location: "Brasil",
  },
  {
    id: 3,
    name: "Trip 3",
    description: "This is my Trip 3...",
    capacity: 30,
    startDate: "05.03.2020",
    endDate: "05.07.2020",
    location: "Peru",
  },
  {
    id: 4,
    name: "Trip 4",
    description: "This is my Trip 4...",
    capacity: 20,
    startDate: "15.06.2020",
    endDate: "18.06.2020",
    location: "Argentina",
  }
];

const TripProvider = createComponent({
  //@@viewOn:statics
  displayName: Config.TAG + "TripProvider",
  //@@viewOff:statics

  render({ children }) {
    //@viewOn:hooks
    const [trips, setTrips] = useState(initialTrips);
    //@viewOff:hooks

    //@@viewOn:private
    function handleCreate(trip) {
      trip.id = UU5.Common.Tools.generateUUID();
      trip.averageRating = Math.round(Math.random() * 5); // <0, 5>
      setTrips(prevTrips => prevTrips.concat([trip]));
    }

    function handleDelete(trip) {
      setTrips(prevTrips => prevTrips.filter(item => item.id !== trip.id));
    }
    //@@viewOff:private

    //@@viewOn:render
    return children({ trips, handleCreate, handleDelete });
    //@@viewOff:render
  }

});

export default TripProvider;
