CLASS lhc_zan_i_so_item DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS CalcTotalPrice FOR DETERMINE ON MODIFY
      IMPORTING keys FOR zan_i_so_item~CalcTotalPrice.

ENDCLASS.

CLASS lhc_zan_i_so_item IMPLEMENTATION.

  METHOD CalcTotalPrice.
    DATA:
      lt_items     TYPE TABLE FOR READ RESULT zan_I_so_head\_item,
      lt_header_up TYPE TABLE FOR UPDATE zan_I_so_head,
      lv_total     TYPE dmbtr.

* Read items of the affected sales orders
    READ ENTITIES OF zan_I_so_head IN LOCAL MODE
        ENTITY zan_I_so_head BY \_item
        FIELDS ( SoId Netpr Currency )
        WITH CORRESPONDING #( keys )
        RESULT lt_items.

* Calculate total per Sales Order
    LOOP AT lt_items INTO DATA(ls_item)
         GROUP BY ( SoId = ls_item-SoId ) INTO DATA(ls_group).

      CLEAR lv_total.

      LOOP AT GROUP ls_group INTO DATA(ls_group_item).
        lv_total = lv_total + ls_group_item-Netpr.
      ENDLOOP.

* Prepare header update
      APPEND VALUE #(
          %tky       = ls_group_item-%tky
          SoId       = ls_group-SoId
          TotalPrice = lv_total
          Currency   = ls_group_item-Currency
      ) TO lt_header_up.

    ENDLOOP.

* Update header
    IF lt_header_up IS NOT INITIAL.
      MODIFY ENTITIES OF zan_I_so_head IN LOCAL MODE
          ENTITY zan_I_so_head
          UPDATE FIELDS ( TotalPrice Currency )
          WITH lt_header_up.

    ENDIF.
  ENDMETHOD.
ENDCLASS.
