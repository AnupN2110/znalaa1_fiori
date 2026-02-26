@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Flight projection'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity zaan_flight_p
  as projection on zaan_flight
{
      @ObjectModel.text.element: [ 'CarrierName' ]
  key CarrierId,
  key ConnectionId,
  key FlightDate,
      _carrier.Name as CarrierName,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Price,
      CurrencyCode,
      PlaneTypeId,
      SeatsMax,
      SeatsOccupied,
      /* Associations */
      _connection : redirected to parent ZAAN_Connection_p,
      _carrier
}
