CLASS lhc_Order DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Order RESULT result.

    METHODS earlynumbering_cba_Itens FOR NUMBERING
      IMPORTING entities FOR CREATE Order\_Itens.

    METHODS SendOrder FOR MODIFY
      IMPORTING keys FOR ACTION Order~SendOrder.

    METHODS updateFields FOR DETERMINE ON SAVE
      IMPORTING keys FOR Order~updateFields.

ENDCLASS.

CLASS lhc_Order IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD earlynumbering_cba_Itens.

    LOOP AT entities INTO DATA(entity).

      LOOP AT entity-%target ASSIGNING FIELD-SYMBOL(<lf_target>).

        SELECT MAX( item )
        FROM ztrpc_order_it
        WHERE order_id = @entity-Orderid
        INTO @DATA(lv_last_item).

        DATA(lv_next_item) = lv_last_item + 1.

        INSERT VALUE #(
            %cid = <lf_target>-%cid
            orderid = <lf_target>-OrderId
            item = lv_next_item
        ) INTO TABLE mapped-item .

      ENDLOOP.

    ENDLOOP.

  ENDMETHOD.

  METHOD SendOrder.

    READ ENTITIES OF zi_rpc_order IN LOCAL MODE
    ENTITY Order
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_data).

    LOOP AT lt_data INTO DATA(ls_data).

      APPEND INITIAL LINE TO reported-order ASSIGNING FIELD-SYMBOL(<lf_rep>).
      <lf_rep>-%key-Orderid = ls_data-Orderid.
      <lf_rep>-%msg = new_message(
                        id       = '00'
                        number   = '001'
                        severity = if_abap_behv_message=>severity-success
                        v1       = 'Ordem enviada com sucesso'
                      ).

    ENDLOOP.

  ENDMETHOD.

  METHOD updateFields.

    READ ENTITIES OF zi_rpc_order IN LOCAL MODE
    ENTITY Order
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_data).

    LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<lf_data>).

        MODIFY ENTITIES OF zi_rpc_order IN LOCAL MODE
        ENTITY Order
        UPDATE
        FIELDS ( usnam ) WITH value #( ( %tky-OrderId = <lf_data>-%tky-OrderId usnam = sy-uname ) ).

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.

CLASS lhc_Item DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS validateQuantity FOR VALIDATE ON SAVE
      IMPORTING keys FOR Item~validateQuantity.

ENDCLASS.

CLASS lhc_Item IMPLEMENTATION.

  METHOD validateQuantity.

    READ ENTITIES OF zi_rpc_order IN LOCAL MODE
    ENTITY Item
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_data).

    LOOP AT lt_data ASSIGNING FIELD-SYMBOL(<lf_item>).

      IF <lf_item>-Quantity < 2.

        APPEND INITIAL LINE TO failed-item ASSIGNING FIELD-SYMBOL(<lf_fail>).
        <lf_fail>-%key-OrderId = <lf_item>-OrderId.
        <lf_fail>-%key-Item = <lf_item>-Item.

        APPEND INITIAL LINE TO reported-item ASSIGNING FIELD-SYMBOL(<lf_rep>).
        <lf_rep>-%key-OrderId = <lf_item>-OrderId.
        <lf_rep>-%key-Item = <lf_item>-Item.
        <lf_rep>-%msg = new_message(
                          id       = '00'
                          number   = '001'
                          severity = if_abap_behv_message=>severity-error
                          v1       = 'Quantidade Minima é 2'
                        ).

      ENDIF.

    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
