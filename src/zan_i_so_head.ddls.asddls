@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View - SO Header'
@Metadata.ignorePropagatedAnnotations: true
define root view entity zan_I_so_head
  as select from zan_so_header
  composition [1..*] of zan_i_so_item as _item
  association [1..1] to zan_cust      as _cust on $projection.Kunnr = _cust.Kunnr
{
  key so_id           as SoId,
      kunnr           as Kunnr,
      vkorg           as Vkorg,
      vtweg           as Vtweg,
      spart           as Spart,
      last_changed_at as LastChangedAt,
      _item,
      _cust
}
