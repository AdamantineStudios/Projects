/* eslint-disable */
const createTripDtoInType = shape({
  name: string(30).isRequired(),
  description: string(30).isRequired(),
  capacity: number().isRequired(),
  startDate: date().isRequired(),
  endDate: date().isRequired(),
  location: id().isRequired()
});

const getTripDtoInType = shape({
  id: id().isRequired()
});

const listTripDtoInType = shape({
  pageInfo: shape({
    pageIndex: integer(),
    pageSize: integer()
  })
});

const updateTripDtoInType = shape({
  id: id().isRequired(),
  name: string(30),
  description: string(30),
  capacity: number(),
  startDate: date(),
  endDate: date(),
  location: id()
});

const deleteTripDtoInType = shape({
  id: id().isRequired(),
  force: boolean()
});

const addRatingDtoInType = shape({
  id: id().isRequired(),
  participant: id().isRequired(),
  rating: oneOf([1, 2, 3, 4, 5]).isRequired(),
  comment: string(500)
});

