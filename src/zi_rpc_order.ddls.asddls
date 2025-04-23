@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Composition Order'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity zi_rpc_order
  as select from zr_rpc_order
  composition [1..*] of zi_rpc_order_it    as _Itens
  association [1..1] to zc_rpc_company_VH  as _Company  on $projection.Company = _Company.CompanyId
  association [1..1] to zc_rpc_customer_VH as _Customer on $projection.Customer = _Customer.CustomerId
  association [1..1] to zc_rpc_vendor_VH   as _Vendor   on $projection.Vendor = _Vendor.VendorId
{
  key Orderid,
      Customer,
      _Customer.Name as CustomerName,
      Vendor,
      _Vendor.Name as VendorName,
      Company,
      _Company.Name as CompanyName,
      Usnam,
      _Itens,
      _Company,
      _Customer,
      _Vendor
}
