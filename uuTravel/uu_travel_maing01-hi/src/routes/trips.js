//@@viewOn:imports
import UU5 from "uu5g04";
import { createVisualComponent, useRef, useContext } from "uu5g04-hooks";
import Config from "./config/config";
import TripList from "../bricks/trips/trip-list";
import TripProvider from "../bricks/trips/trip-provider";
import TripCreate from "../bricks/trips/trip-create";
//import TripUpdateForm from "../bricks/trip-update-form";
import TripTitle from "../bricks/trips/trips-title";
import TripInstanceContext from "../bricks/trips/trip-instance-context";
import TripDetail from "../bricks/trips/trip-detail";

//@@viewOff:imports

const Trips = createVisualComponent({
  //@@viewOn:statics
  displayName: Config.TAG + "Trips",
  //@@viewOff:statics

  render() {
    //@@viewOn:hooks
    const { syncData: tripInstance } = useContext(TripInstanceContext);
    const createTripRef = useRef();
    const updateTripRef = useRef();
    const deleteTripRef = useRef();
    const updateFormRef = useRef();
    const detailRef = useRef();
    //@viewOff:hooks

    //@@viewOn:private
    async function handleCreateTrip(trip) {
      try {
        await createTripRef.current(trip);
      } catch {
        UU5.Environment.getPage()
          .getAlertBus()
          .addAlert({
            content: <UU5.Bricks.Lsi lsi={Lsi.createFailed} params={[trip.destination]} />,
            colorSchema: "red"
          });
      }
    }

    {/*
    async function handleUpdateTrip(trip, values) {
      try {
        await updateTripRef.current(trip.id, values);
      } catch {
        UU5.Environment.getPage()
          .getAlertBus()
          .addAlert({
            content: <UU5.Bricks.Lsi lsi={Lsi.updateFailed} params={[trip.destination]} />,
            colorSchema: "red"
          });
      }
    }
    */}

    async function handleDeleteTrip(trip) {
      try {
        await deleteTripRef.current(trip.id);
      } catch {
        UU5.Environment.getPage()
          .getAlertBus()
          .addAlert({
            content: <UU5.Bricks.Lsi lsi={Lsi.deleteFailed} params={[trip.name]} />,
            colorSchema: "red"
          });
      }
    }

    function openDetail(trip) {
      detailRef.current.open(trip);
    }

    function openUpdateForm(trip) {
      updateFormRef.current.open(trip);
    }

    function isCreateAuthorized() {
      return UU5.Common.Tools.hasSomeProfiles(tripInstance.authorizedProfileList);
    }
    //@@viewOff:private

    //@@viewOn:render
    function renderLoad() {
      return <UU5.Bricks.Loading />;
    }

    function renderReady() {
      return (
        <TripProvider>
          {({ viewState, trips, handleCreate, handleDelete }) => {
            return (
              <>
                <TripCreate onCreate={handleCreate} />
                <TripList trips={trips} onDelete={handleDelete} />
              </>
            );
          }}
        </TripProvider>

      /* <TripTitle trips={trip}/>
          {isCreateAuthorized() && <TripCreate onCreate={handleCreateTrip} />}

          <TripList
            trips={trip}
            onLoad={handleLoad}
            onDetail={openDetail}
            onUpdate={openUpdateForm}
            onDelete={handleDeleteTrip}
          />
          <TripUpdateForm ref={updateFormRef} onSave={handleUpdateTrip} />
          <TripDetail ref={detailRef} />*/

      );
    }

    function renderError(trip, errorState, handleLoad) {
      switch (errorState) {
        case "create":
        case "update":
        case "delete":
          return renderReady(trip, handleLoad);
        case "load":
        default:
          return <UU5.Bricks.Error content="Error happened!" />;
      }
    }

    return (
      <UU5.Bricks.Container>
        <TripProvider>
          {({ viewState, asyncData, handleLoad, handleCreate, handleUpdate, handleDelete, errorState }) => {
            createTripRef.current = handleCreate;
            updateTripRef.current = handleUpdate;
            deleteTripRef.current = handleDelete;

            switch (viewState) {
              case "load":
                return renderLoad();
              case "error":
                return renderError(asyncData, errorState, handleLoad);
              default:
                return renderReady(asyncData, handleLoad);
            }
          }}
        </TripProvider>
      </UU5.Bricks.Container>
    );
    //@@viewOff:render
  }
});

export default Trips;
