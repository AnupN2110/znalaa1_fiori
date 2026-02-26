@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connectiondetails'
@Metadata.ignorePropagatedAnnotations: true
@UI.headerInfo: { typeName: 'Connection',
                  typeNamePlural: 'Connection Details' }                 
define root view entity zaan_connection
  as select from /dmo/connection as connection
  composition [1..*] of zaan_flight  as _flight  
  association [1..1] to zaan_carrier as _carrier on  $projection.CarrierId = _carrier.CarrierId

{
      @ObjectModel.text.association: '_carrier'
  key carrier_id      as CarrierId,
  key connection_id   as ConnectionId,
      airport_from_id as AirportFromId,
      airport_to_id   as AirportToId,
      departure_time  as DepartureTime,
      arrival_time    as ArrivalTime,
      distance        as Distance,
      distance_unit   as DistanceUnit,
      _carrier,
      _flight
}
