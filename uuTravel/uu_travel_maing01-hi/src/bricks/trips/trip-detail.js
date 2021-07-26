//@@viewOn:imports
import UU5 from "uu5g04";
import { createVisualComponentWithRef, useRef, useImperativeHandle } from "uu5g04-hooks";
import Config from "../../config/config";
import TripDetailContent from "./trip-detail-content";
import Css from "./trip-detail.css.js";
//@@viewOff:imports

const TripDetail = createVisualComponentWithRef({
  //@@viewOn:statics
  displayName: Config.TAG + "TripDetail",
  //@@viewOff:statics

  render(props, ref) {
    //@@viewOn:hooks
    const modalRef = useRef();

    useImperativeHandle(ref, () => ({
      open: trip => {
        modalRef.current.open({
          header: trip.name,
          content: <TripDetailContent trip={trip} />,
          className: Css.main
        });
      }
    }));
    //@@viewOff:hooks

    //@@viewOn:private
    //@@viewOff:private

    //@@viewOn:render
    return <UU5.Bricks.Modal ref_={modalRef} />;
    //@@viewOff:render
  }
});

export default TripDetail;
