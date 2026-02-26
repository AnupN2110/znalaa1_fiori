CLASS lhc_zaan_connection DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zaan_connection RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR zaan_connection RESULT result.
    METHODS validate_airportfrom FOR VALIDATE ON SAVE
      IMPORTING keys FOR zaan_connection~validate_airportfrom.

    METHODS validate_airportto FOR VALIDATE ON SAVE
      IMPORTING keys FOR zaan_connection~validate_airportto.

ENDCLASS.

CLASS lhc_zaan_connection IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD validate_airportfrom.

    READ ENTITY IN LOCAL MODE zaan_connection
    FIELDS ( AirportFromId ) WITH CORRESPONDING #( keys )
    RESULT DATA(lt_connection).

    READ TABLE lt_connection INTO DATA(ls_con) INDEX 1.

    IF ls_con-AirportFromId IS INITIAL.
      APPEND VALUE #( %tky = ls_con-%tky  ) TO failed-zaan_connection.
      APPEND VALUE #( %tky = ls_con-%tky
                      %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                    text = 'Invalid AirportFrom' ) ) TO reported-zaan_connection.
    ENDIF.


  ENDMETHOD.

  METHOD validate_airportto.
    READ ENTITY IN LOCAL MODE zaan_connection
    FIELDS ( AirportToId ) WITH CORRESPONDING #( keys )
    RESULT DATA(lt_con).

    READ TABLE lt_con INTO DATA(ls_con) INDEX 1.
    IF ls_con-AirportToId IS INITIAL.
      APPEND VALUE #( %tky = ls_con-%tky ) TO failed-zaan_connection.
      APPEND VALUE #( %tky = ls_con-%tky
                      %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                    text = 'Invalid AirportTo' )  )
                                                    TO reported-zaan_connection.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
