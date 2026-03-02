@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'interface view'
@Metadata.ignorePropagatedAnnotations: true
define view entity zan_cust
  as select from zan_cust_master
{
  key kunnr as Kunnr,
      name1 as Name1
}
