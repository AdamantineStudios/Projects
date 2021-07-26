/* eslint-disable */
const locationCreateDtoInType = shape({
  name: string(200).isRequired(),
  country: string(100).isRequired(),
  city: string(100).isRequired(),
  street: string(100).isRequired(),
  zipCode: number().isRequired(),
  capacity: number(5000).isRequired()
});

const locationGetDtoInType = shape({
  id: id().isRequired()
});

const locationListDtoInType = shape({
  pageInfo: shape({
    pageIndex: integer(),
    pageSize: integer()
  })
});

const locationUpdateDtoInType = shape({
  id: id().isRequired(),
  name: string(200),
  country: string(100),
  city: string(100),
  street: string(100),
  zipCode: number(),
  capacity: number(5000)
});

const locationDeleteDtoInType = shape({
  id: id().isRequired(),
  force: boolean()
});


