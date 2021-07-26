//@@viewOn:imports
import UU5 from "uu5g04";
import { createVisualComponent } from "uu5g04-hooks";
import Config from "../config/config";
import Trip from "./trip"
//@@viewOff:imports

const TripList = createVisualComponent({
  //@@viewOn:statics
  displayName: Config.TAG + "TripList",
  //@@viewOff:statics

  //@@viewOn:propTypes
  propTypes: {
    trips: UU5.PropTypes.array.isRequired,
    onDetail: UU5.PropTypes.func,
    onUpdate: UU5.PropTypes.func,
    onDelete: UU5.PropTypes.func
  },
  //@@viewOff:propTypes

  //@@viewOn:defaultProps
  defaultProps: {
    trips: [],
    onDetail: () => {},
    onUpdate: () => {},
    onDelete: () => {}
  },
  //@@viewOff:defaultProps

  render({ trips, onDetail, onUpdate, onDelete }) {
    //@@viewOn:render
    if (trips.length === 0) {
      return <UU5.Common.Error content="No trips!" />;
    }

    return (
      <UU5.Bricks.Row>
        {trips.map(trip => (
          <UU5.Bricks.Column key={trip.id} colWidth="xs-12 m-6 l-4 xl-3">
            <Trip trip={trip} onDetail={onDetail} onUpdate={onUpdate} onDelete={onDelete} />
          </UU5.Bricks.Column>
        ))}
      </UU5.Bricks.Row>
    );
    //@@viewOff:render
  }
});

export default TripList;
