@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connection projection view'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZAAN_Connection_p
  provider contract transactional_query
  as projection on zaan_connection
{
      @ObjectModel.text.element: [ 'CarrierName' ]
  key CarrierId,
  key ConnectionId,
      _carrier.Name as CarrierName,
      AirportFromId,
      AirportToId,
      DepartureTime,
      ArrivalTime,
      Distance,
      DistanceUnit,
      /* Associations */
      _carrier,
      _flight : redirected to composition child zaan_flight_p
}
