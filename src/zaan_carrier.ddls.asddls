@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Carrier text'
@Metadata.ignorePropagatedAnnotations: true
define view entity zaan_carrier
  as select from /dmo/carrier
{
  key carrier_id    as CarrierId,
      @Semantics.text: true
      name          as Name,
      currency_code as CurrencyCode
}
