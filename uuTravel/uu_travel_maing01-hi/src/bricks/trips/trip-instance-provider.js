//@@viewOn:imports
import Calls from "calls";
import { createComponent, useData } from "uu5g04-hooks";
import Config from "../../config/config";
import TripInstanceContext from "./trip-instance-context";
//@@viewOff:imports

const TripInstanceProvider = createComponent({
  //@@viewOn:statics
  displayName: Config.TAG + "TripInstanceProvider",
  //@@viewOff:statics

  render({ children }) {
    //@@viewOn:hooks
    const state = useData({ dtoIn: {}, onLoad: Calls.loadTripInstance });
    //@@viewOff:hooks

    //@@viewOn:render
    return <TripInstanceContext.Provider value={state}>{children}</TripInstanceContext.Provider>;
    //@@viewOff:render
  }
});

export default TripInstanceProvider;
