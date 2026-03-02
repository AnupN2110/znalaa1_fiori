CLASS lhc_zan_I_so_head DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zan_I_so_head RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR zan_I_so_head RESULT result.

    METHODS earlynumbering_cba_Item FOR NUMBERING
      IMPORTING entities FOR CREATE zan_I_so_head\_Item.

    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING entities FOR CREATE zan_I_so_head.


ENDCLASS.

CLASS lhc_zan_I_so_head IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD earlynumbering_create.

    DATA lt_head TYPE TABLE FOR MAPPED EARLY zan_I_so_head.
    DATA ls_head LIKE LINE OF lt_head.
    DATA l_soid  TYPE kunnr.

    DATA(lt_entity) = entities.
    DELETE lt_entity WHERE SoId IS NOT INITIAL.

    SELECT FROM zan_so_header FIELDS MAX( so_id ) INTO @l_soid.
    IF sy-subrc NE 0.
      LOOP AT lt_entity INTO DATA(ls_entity).
        ls_head = VALUE #( %cid = ls_entity-%cid
                           SoId = '0000001001' ).
        APPEND ls_head TO mapped-zan_i_so_head.

      ENDLOOP.
    ELSE.
      l_soid = l_soid + 1.
      l_soid = |{ l_soid ALPHA = IN }|.
      LOOP AT lt_entity INTO ls_entity.
        ls_head = VALUE #( %cid = ls_entity-%cid
                           SoId = l_soid ).
        APPEND ls_head TO mapped-zan_i_so_head.
      ENDLOOP.
    ENDIF.



  ENDMETHOD.

  METHOD earlynumbering_cba_Item.

    DATA l_posnr TYPE posnr.
    DATA l_posnr_new TYPE posnr.
    DATA lt_item TYPE TABLE FOR MAPPED EARLY zan_i_so_item.
    DATA ls_item LIKE LINE OF lt_item.


    READ ENTITY IN LOCAL MODE zan_I_so_head
    FIELDS ( SoId )
    WITH CORRESPONDING #( entities )
    RESULT DATA(it_result).

    READ TABLE it_result INTO DATA(ls_result) INDEX 1.
    DATA(lt_entity) = entities.

    SELECT FROM zan_so_item
    FIELDS MAX( posnr )
    WHERE so_id = @ls_result-SoId
    INTO @l_posnr.

    IF sy-subrc NE 0.
      LOOP AT lt_entity INTO DATA(ls_entity).
        LOOP AT ls_entity-%target INTO DATA(lwa_entity).
          ls_item = VALUE #( %cid = lwa_entity-%cid
                             SoId = lwa_entity-SoId
                             Posnr = '00010' ).
          APPEND ls_item TO mapped-zan_i_so_item.
        ENDLOOP.
      ENDLOOP.
    ELSE.
      l_posnr_new = l_posnr + 10.
      l_posnr_new = |{ l_posnr_new ALPHA = IN }|.
      LOOP AT lt_entity INTO ls_entity.
        LOOP AT ls_entity-%target INTO lwa_entity.
          ls_item = VALUE #( %cid = lwa_entity-%cid
                             SoId = lwa_entity-SoId
                             Posnr = l_posnr_new ).
          APPEND ls_item TO mapped-zan_i_so_item.

        ENDLOOP.
      ENDLOOP.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
