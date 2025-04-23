@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Valeu Help Customer'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zc_rpc_customer_VH
  as select from ztrpc_customer
{
      @ObjectModel.text.element: [ 'Name' ]
      @EndUserText.label: 'ID Cliente'
  key customer_id as CustomerId,
  
      @Semantics.text: true
      @EndUserText.label: 'Nome Cliente'
      name        as Name
}
group by
customer_id,
name
