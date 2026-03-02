@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View - SO Item'
@Metadata.ignorePropagatedAnnotations: true
define view entity zan_i_so_item
  as select from zan_so_item
  association to parent zan_I_so_head as _head on $projection.SoId = _head.SoId
{
  key so_id    as SoId,
  key posnr    as Posnr,
      matnr    as Matnr,
      @Semantics.quantity.unitOfMeasure: 'Uom'
      menge    as Menge,
      uom      as Uom,
      @Semantics.amount.currencyCode: 'Currency'
      netpr    as Netpr,
      currency as Currency,
      _head
}
