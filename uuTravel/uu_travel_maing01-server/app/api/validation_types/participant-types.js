/* eslint-disable */
const createParticipantDtoInType = shape({
  firstName: string(200).isRequired(),
  lastName: string(100).isRequired(),
  email: string(100).isRequired(),
  trip: id().isRequired()
});

const getParticipantDtoInType = shape({
  id: id().isRequired()
});

const listParticipantDtoInType = shape({
  pageInfo: shape({
    pageIndex: integer(),
    pageSize: integer()
  })
});

const updateParticipantDtoInType = shape({
  id: id().isRequired(),
  firstName: string(200),
  lastName: string(100),
  email: string(100),
  trip: id()
});

const deleteParticipantDtoInType = shape({
  id: id().isRequired()
});




