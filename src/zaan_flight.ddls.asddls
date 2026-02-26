@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight details'
@Metadata.ignorePropagatedAnnotations: true
define view entity zaan_flight
  as select from /dmo/flight
  association        to parent zaan_connection as _connection on  $projection.CarrierId    = _connection.CarrierId
                                                              and $projection.ConnectionId = _connection.ConnectionId
  association [1..1] to zaan_carrier           as _carrier    on  $projection.CarrierId = _carrier.CarrierId

{
      @ObjectModel.text.association: '_carrier'
  key carrier_id     as CarrierId,
  key connection_id  as ConnectionId,
  key flight_date    as FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      price          as Price,
      currency_code  as CurrencyCode,
      plane_type_id  as PlaneTypeId,
      seats_max      as SeatsMax,
      seats_occupied as SeatsOccupied,
      _connection,
      _carrier
}
