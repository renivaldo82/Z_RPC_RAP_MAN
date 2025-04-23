CLASS zcl_rpc_cargas DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rpc_cargas IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    TYPES: tt_product  TYPE TABLE OF ztrpc_product WITH DEFAULT KEY,
           tt_vendor   TYPE TABLE OF ztrpc_vendor WITH DEFAULT KEY,
           tt_company  TYPE TABLE OF ztrpc_company WITH DEFAULT KEY,
           tt_customer TYPE TABLE OF ztrpc_customer WITH DEFAULT KEY.

    DATA(lo_uuid) = cl_uuid_factory=>create_system_uuid( ).

    DATA(lt_product) = VALUE tt_product(
         ( product_id = lo_uuid->create_uuid_x16( ) description = 'iPhone 14 Pro' value = '12000.00' currency = 'BRL' quantity = '1000' unity_measure = 'EA' )
         ( product_id = lo_uuid->create_uuid_x16( ) description = 'iPhone 13 Pro' value = '7000.00'  currency = 'USD' quantity = '2000' unity_measure = 'EA' )
         ( product_id = lo_uuid->create_uuid_x16( ) description = 'iPhone 12 Pro' value = '4000.00'  currency = 'BRL' quantity = '5400' unity_measure = 'EA' )
         ( product_id = lo_uuid->create_uuid_x16( ) description = 'Monitor 34' value = '2000.00'  currency = 'BRL' quantity = '400' unity_measure = 'EA' )
         ( product_id = lo_uuid->create_uuid_x16( ) description = 'Monitor 48' value = '3000.00'  currency = 'BRL' quantity = '3400' unity_measure = 'EA' )
         ( product_id = lo_uuid->create_uuid_x16( ) description = 'Galaxy Note' value = '5000.00'  currency = 'BRL' quantity = '6400' unity_measure = 'EA' )
     ).

    DATA(lt_vendor) = VALUE tt_vendor(
         ( vendor_id = lo_uuid->create_uuid_x16( ) name = 'João Silva' )
         ( vendor_id = lo_uuid->create_uuid_x16( ) name = 'Maria Silva' )
         ( vendor_id = lo_uuid->create_uuid_x16( ) name = 'Renivaldo' )
         ( vendor_id = lo_uuid->create_uuid_x16( ) name = 'Luiz' )
         ( vendor_id = lo_uuid->create_uuid_x16( ) name = 'Antonio' )
         ( vendor_id = lo_uuid->create_uuid_x16( ) name = 'Rodrigo' )
         ( vendor_id = lo_uuid->create_uuid_x16( ) name = 'Jonathan' )
     ).

    DATA(lt_company) = VALUE tt_company(
        ( company_id = lo_uuid->create_uuid_x16( ) name = 'Apple' )
        ( company_id = lo_uuid->create_uuid_x16( ) name = 'LG' )
        ( company_id = lo_uuid->create_uuid_x16( ) name = 'Samsung' )
    ).

    DATA(lt_customer) = VALUE tt_customer(
        ( customer_id = lo_uuid->create_uuid_x16( ) name = 'Vitoria' )
        ( customer_id = lo_uuid->create_uuid_x16( ) name = 'Rafael' )
        ( customer_id = lo_uuid->create_uuid_x16( ) name = 'Anderson' )
        ( customer_id = lo_uuid->create_uuid_x16( ) name = 'Eduardo' )
        ( customer_id = lo_uuid->create_uuid_x16( ) name = 'Nubia' )
        ( customer_id = lo_uuid->create_uuid_x16( ) name = 'Fernando' )
        ( customer_id = lo_uuid->create_uuid_x16( ) name = 'Valissa' )
        ( customer_id = lo_uuid->create_uuid_x16( ) name = 'Edson' )
        ( customer_id = lo_uuid->create_uuid_x16( ) name = 'Erick' )
        ( customer_id = lo_uuid->create_uuid_x16( ) name = 'Thiago' )
    ).

    DELETE FROM ztrpc_product.
    DELETE FROM ztrpc_vendor.
    DELETE FROM ztrpc_company.
    DELETE FROM ztrpc_customer.

    MODIFY ztrpc_product FROM TABLE @lt_product.
    MODIFY ztrpc_vendor FROM TABLE @lt_vendor.
    MODIFY ztrpc_company FROM TABLE @lt_company.
    MODIFY ztrpc_customer FROM TABLE @lt_customer.

  ENDMETHOD.

ENDCLASS.
