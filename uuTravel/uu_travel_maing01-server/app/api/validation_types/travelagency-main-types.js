/* eslint-disable */
const initDtoInType = shape({
  authoritiesUri: uri().isRequired(),
  name: string(30)
});

const updateDtoInType = shape({
  name: string(30),
  state: oneOf(["active", "underConstruction", "closed"])
});
