@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Consuption Order Itens'
@Metadata.ignorePropagatedAnnotations: false
@Metadata.allowExtensions: true
define view entity zc_rpc_order_it
  as projection on zi_rpc_order_it
{
  key OrderId,
  key Item,     
      @Consumption.valueHelpDefinition: [{ entity: { name: 'zc_rpc_product_VH', element: 'ProductId' }, useForValidation: true }]
      @ObjectModel.text.element: [ 'Description' ]
      Product,
      Description,
      Value,
      Currency,
      Quantity,
      SalesPrice,
      UnityMeasure,
      /* Associations */
      _Order: redirected to parent zc_rpc_order,
      _Product
}
