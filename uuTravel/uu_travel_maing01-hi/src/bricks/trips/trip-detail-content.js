//@@viewOn:imports
import UU5 from "uu5g04";
import { createVisualComponent, useContext } from "uu5g04-hooks";
import Calls from "calls";
import TripInstanceContext from "./trip-instance-context";
import Config from "../../config/config";
import Css from "./trip-detail-content.css";
//@@viewOff:imports

const TripDetailContent = createVisualComponent({
  //@@viewOn:statics
  displayName: Config.TAG + "TripDetailContent",
  //@@viewOff:statics

  //@@viewOn:propTypes
  propTypes: {
    trip: UU5.PropTypes.shape({
      name: UU5.PropTypes.string,
      text: UU5.PropTypes.string,
      averageRating: UU5.PropTypes.number,
      uuIdentity: UU5.PropTypes.string
    }).isRequired
  },
  //@@viewOff:propTypes

  //@@viewOn:defaultProps
  defaultProps: {
    trip: null
  },
  //@@viewOff:defaultProps

  render({ trip }) {
    //@@viewOn:hooks
    const {
      syncData: { categoryList }
    } = useContext(TripInstanceContext);
    //@@viewOff:hooks

    //@@viewOn:private
    function buildCategoryNames() {
      // for faster lookup
      let categoryIds = new Set(categoryList);
      return categoryList
        .reduce((acc, category) => {
          if (categoryIds.has(category.id)) {
            acc.push(category.name);
          }
          return acc;
        }, [])
        .join(", ");
    }
    //@@viewOff:private

    //@@viewOn:render
    function renderLine(icon, content) {
      return (
        <div className={Css.line}>
          <UU5.Bricks.Icon className={Css.icon} icon={icon} />
          {content}
        </div>
      );
    }

    return (
      <div>
        {trip.destination}
        {renderLine("mdi-account", trip.uuIdentityName)}
        {renderLine("mdi-calendar", <UU5.Bricks.DateTime value={trip.sys.cts} dateOnly />)}
      </div>
    );
    //@@viewOff:render
  }
});

export default TripDetailContent;
