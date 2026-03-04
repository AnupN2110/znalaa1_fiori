CLASS lhc_zan_i_so_item DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS CalPrice FOR DETERMINE ON MODIFY
      IMPORTING keys FOR zan_i_so_item~CalPrice.

ENDCLASS.

CLASS lhc_zan_i_so_item IMPLEMENTATION.

  METHOD CalPrice.

    MODIFY ENTITIES OF zan_I_so_head IN LOCAL MODE
    ENTITY zan_I_so_head
    EXECUTE CalTotPrice
    FROM CORRESPONDING #( keys ).


  ENDMETHOD.

ENDCLASS.
