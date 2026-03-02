CLASS zcl_an_create_so_head_item DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_an_create_so_head_item IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA l_timestamp TYPE timestampl.
    DATA lt_so_head TYPE STANDARD TABLE OF zan_so_header.
    DATA lt_so_item TYPE STANDARD TABLE OF zan_so_item.
*
    GET TIME STAMP FIELD l_timestamp.

    lt_so_head = VALUE #( ( client = sy-mandt so_id = '0000001001' kunnr = '5001' vkorg = '9000' vtweg = '90' spart = '00' last_changed_at = l_timestamp )
                          ( client = sy-mandt so_id = '0000001002' kunnr = '5002' vkorg = '9000' vtweg = '90' spart = '00' last_changed_at = l_timestamp )
                          ( client = sy-mandt so_id = '0000001003' kunnr = '5003' vkorg = '9000' vtweg = '90' spart = '00' last_changed_at = l_timestamp )
                         ).

    MODIFY zan_so_header FROM TABLE @lt_so_head.


    lt_so_item = VALUE #( ( client = sy-mandt so_id = '0000001001' posnr = '10' matnr = 'ART1' menge = '10' uom = 'ST' netpr = '79.90' currency = 'EUR' )
                          ( client = sy-mandt so_id = '0000001002' posnr = '10' matnr = 'ART2' menge = '15' uom = 'KG' netpr = '89.90' currency = 'EUR' )
                          ( client = sy-mandt so_id = '0000001003' posnr = '10' matnr = 'ART3' menge = '20' uom = 'ST' netpr = '99.90' currency = 'EUR' )
                        ).

    MODIFY zan_so_item FROM TABLE @lt_so_item.

*    SELECT FROM zan_so_header FIELDS * INTO TABLE @lt_so_head.
*    SELECT FROM zan_so_item FIELDS * INTO TABLE @lt_so_item.
*    DELETE zan_so_header FROM TABLE @lt_so_head.
*    DELETE zan_so_item FROM TABLE @lt_so_item.



  ENDMETHOD.

ENDCLASS.
