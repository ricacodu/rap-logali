CLASS lhc_Headers DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Headers RESULT result.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Headers RESULT result.

    METHODS cancelOrder FOR MODIFY
      IMPORTING keys FOR ACTION Headers~cancelOrder RESULT result.

    METHODS validateDates FOR VALIDATE ON SAVE
      IMPORTING keys FOR Headers~validateDates.

    METHODS validateStatusOrder FOR VALIDATE ON SAVE
      IMPORTING keys FOR Headers~validateStatusOrder.

ENDCLASS.

CLASS lhc_Headers IMPLEMENTATION.

  METHOD get_instance_features.

    READ ENTITIES OF  z_i_root__1297
    ENTITY  Headers
    FIELDS ( Idheader orderstatus )
    WITH VALUE #( FOR key_row IN keys ( %key  = key_row-%key ) )
    RESULT DATA(lt_so_result).


  result = VALUE #( FOR salesorder_row IN lt_so_result (
                          %key                = salesorder_row-%key
                          %field-Idheader     = if_abap_behv=>fc-f-read_only
                          %action-cancelOrder = COND #( WHEN salesorder_row-orderstatus = 0
                                                        THEN if_abap_behv=>fc-o-enabled
                                                        ELSE if_abap_behv=>fc-o-disabled )
                          %assoc-_Items = if_abap_behv=>fc-o-enabled ) ).
  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

METHOD cancelOrder.

        MODIFY ENTITIES OF z_i_root__1297 IN LOCAL MODE
          ENTITY Headers
          UPDATE FIELDS ( orderstatus )
          WITH VALUE #( FOR key_row IN keys ( Idheader = key_row-Idheader
                                              orderstatus = 1 ) ) "Canceled
          FAILED failed
          REPORTED reported.

          READ ENTITIES OF z_i_root__1297 IN LOCAL MODE
          ENTITY Headers
          fields (  email
                    firstname
                    lastname
                    country
                    createon
                    deliverydate
                    orderstatus
                    imageurl
                 )
           WITH VALUE #( FOR key_row1 IN keys ( Idheader = key_row1-Idheader ) )
                 RESULT DATA(lt_order).

     result = VALUE #( FOR order_row IN lt_order ( Idheader = order_row-Idheader
                                                   %param =  order_row ) ).

*  Informando REPORTED es la forma de hacerle llegar al usuario el error que se ha producido
    LOOP AT lt_order ASSIGNING FIELD-SYMBOL(<fs_order>).
      APPEND VALUE #( %key      = <fs_order>-%key
                      Idheader  = <fs_order>-Idheader
                      %msg      = new_message( id = 'Z_MCL_HEADERS_1297'
                                                number = '001'
                                                v1 =  <fs_order>-Idheader
                                                severity = if_abap_behv_message=>severity-success )
                      %element-orderstatus = if_abap_behv=>mk-on ) TO reported-headers.
    ENDLOOP.

  ENDMETHOD.

  METHOD validateDates.
  ENDMETHOD.

  METHOD validateStatusOrder.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_Items DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Items RESULT result.

    METHODS validateDates FOR VALIDATE ON SAVE
      IMPORTING keys FOR Items~validateDates.

ENDCLASS.

CLASS lhc_Items IMPLEMENTATION.

    METHOD get_instance_features.

      READ ENTITIES OF z_i_root__1297
              ENTITY Items
              FIELDS ( id )
                WITH VALUE #( FOR key_row IN keys ( %key  = key_row-%key ) )
              RESULT DATA(lt_items_result).

       result = VALUE #( FOR soitems_row IN lt_items_result (
                             %key = soitems_row-%key
                             %field-id = if_abap_behv=>fc-f-read_only ) ).

    ENDMETHOD.

  METHOD validateDates.
  ENDMETHOD.

ENDCLASS.
