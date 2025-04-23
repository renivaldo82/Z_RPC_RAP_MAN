@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Consuption Order'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity zc_rpc_order
  provider contract transactional_query
  as projection on zi_rpc_order
{
      @Consumption.valueHelpDefinition: [{ entity: { name: 'zc_rpc_order_VH',  element: 'Orderid' }, useForValidation: true }]
  key Orderid,      
      @Consumption.valueHelpDefinition: [{ entity: { name: 'zc_rpc_customer_VH',  element: 'CustomerId' }, useForValidation: true }]
      @ObjectModel.text.element: [ 'CustomerName' ]
      Customer,
      CustomerName,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'zc_rpc_vendor_VH',  element: 'VendorId' }, useForValidation: true }]
      @ObjectModel.text.element: [ 'VendorName' ]
      Vendor,
      VendorName,
      @Consumption.valueHelpDefinition: [{ entity: { name: 'zc_rpc_company_VH',  element: 'CompanyId' }, useForValidation: true }]
      @ObjectModel.text.element: [ 'CompanyName' ]
      Company,
      CompanyName,
      Usnam,
      /* Associations */
      _Itens: redirected to composition child zc_rpc_order_it
}
