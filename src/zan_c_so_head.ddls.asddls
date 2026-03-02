@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View - Root Entity'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity zan_c_so_head
  provider contract transactional_query
  as projection on zan_I_so_head
{
  key SoId,
      @ObjectModel.text.element: [ 'CustomerName' ]
      @Consumption.valueHelpDefinition: [{ entity.name: 'ZAN_CUST' , entity.element: 'Kunnr' }]
      Kunnr,
      _cust.name1 as CustomerName,
      Vkorg,
      Vtweg,
      Spart,
      LastChangedAt,
      /* Associations */
      _cust,
      _item : redirected to composition child zan_c_so_item

}
