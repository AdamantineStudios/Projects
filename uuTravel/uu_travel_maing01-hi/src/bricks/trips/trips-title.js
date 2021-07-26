//@@viewOn:imports
import UU5 from "uu5g04";
import { createComponent, useEffect } from "uu5g04-hooks";
import Config from "../config/config";
//@@viewOff:imports

const TripsTitle = createComponent({
  //@@viewOn:statics
  displayName: Config.TAG + "TripsTitle",
  //@@viewOff:statics

  //@@viewOn:propTypes
  propTypes: {
    trips: UU5.PropTypes.array.isRequired
  },
  //@@viewOff:propTypes

  //@@viewOn:defaultProps
  defaultProps: {
    trips: []
  },
  //@@viewOff:defaultProps

  render({ trips }) {
    //@@viewOn:hooks

    /* Title */
    useEffect(() => {
      const originalTitle = document.title;
      document.title = `${originalTitle} - ${trips.length} trips`;

      return () => (document.title = originalTitle);
    }, [trips.length]);
    //@@viewOff:hooks

    //@@viewOn:render
    return null;
    //@@viewOff:render
  }
});

export default TripsTitle;
