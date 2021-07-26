//@@viewOn:imports
import UU5 from "uu5g04";
import {createVisualComponent} from "uu5g04-hooks";
import Config from "../config/config";
import Css from "./trip.css";
//@@viewOff:imports

const Trip = createVisualComponent({
  //@@viewOn:statics
  displayName: Config.TAG + "Trip",
  //@@viewOff:statics

  //@@viewOn:propTypes
  propTypes: {
    trip: UU5.PropTypes.shape({
      name: UU5.PropTypes.string,
      description: UU5.PropTypes.string,
      capacity: UU5.PropTypes.number,
      startDate: UU5.PropTypes.string,
      endDate: UU5.PropTypes.string,
      location: UU5.Bricks.string
    }),
    colorSchema: UU5.PropTypes.string,
    onDetail: UU5.PropTypes.func,
    onUpdate: UU5.PropTypes.func,
    onDelete: UU5.PropTypes.func
  },
  //@@viewOff:propTypes

  //@@viewOn:defaultProps
  defaultProps: {
    trip: null,
    colorSchema: "default",
    onDetail: () => {
    },
    onUpdate: () => {
    },
    onDelete: () => {
    }
  },
  //@@viewOff:defaultProps

  render({trip, colorSchema, onDetail, onUpdate, onDelete}) {
    //@@viewOn:private
    function handleDetail() {
      onDetail(trip);
    }

    function handleUpdate() {
      onUpdate(trip);
    }

    function handleDelete() {
      onDelete(trip);
    }

    //@@viewOff:private
    //@@viewOn:render
    if (!trip) {
      return null;
    }

    return (
      <UU5.Bricks.Card className={Css.main} colorSchema={colorSchema}>
        <UU5.Bricks.Text className={Css.name} onClick={handleDetail}>
          {trip.name}
        </UU5.Bricks.Text>
        <UU5.Bricks.Text className={Css.location}>
          {trip.location}
        </UU5.Bricks.Text>
        <UU5.Bricks.Div className={Css.content} onClick={handleDetail}>
          <UU5.Bricks.Paragraph className={Css.description}>
            {trip.description}
          </UU5.Bricks.Paragraph>
          <UU5.Bricks.Div>
            <UU5.Bricks.Icon icon="mdi-calendar"/><UU5.Bricks.Span
            className={Css.startDate}>{trip.startDate}</UU5.Bricks.Span>
          </UU5.Bricks.Div>
          <UU5.Bricks.Div>
            <UU5.Bricks.Icon icon="mdi-calendar"/><UU5.Bricks.Span
            className={Css.endDate}>{trip.endDate}</UU5.Bricks.Span>
          </UU5.Bricks.Div>
        </UU5.Bricks.Div>
        <div className={Css.footer}>


          <div>
            <UU5.Bricks.Button onClick={handleUpdate} bgStyle="transparent">
              <UU5.Bricks.Icon className={Css.icon} icon="mdi-pencil"/>
            </UU5.Bricks.Button>
            <UU5.Bricks.Button onClick={handleDelete} bgStyle="transparent">
              <UU5.Bricks.Icon className={Css.icon} icon="mdi-delete"/>
            </UU5.Bricks.Button>
          </div>
        </div>
      </UU5.Bricks.Card>
    );
    //@@viewOff:render
  }
});

export default Trip;
