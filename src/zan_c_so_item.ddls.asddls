@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection view - Child entity'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity zan_c_so_item
  as projection on zan_i_so_item
{
  key SoId,
  key Posnr,
      Matnr,
      @Semantics.quantity.unitOfMeasure: 'Uom'
      Menge,
      Uom,
      @Semantics.amount.currencyCode: 'Currency'
      Netpr,
      Currency,
      /* Associations */
      _head : redirected to parent zan_c_so_head
}
