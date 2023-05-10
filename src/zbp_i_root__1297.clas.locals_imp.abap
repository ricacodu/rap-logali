CLASS lhc_Headers DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Headers RESULT result.

*    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
*      IMPORTING keys REQUEST requested_authorizations FOR Headers RESULT result.

    METHODS validateDates FOR VALIDATE ON SAVE
      IMPORTING keys FOR Headers~validateDates.

    METHODS validateStatusOrder FOR VALIDATE ON SAVE
      IMPORTING keys FOR Headers~validateStatusOrder.

ENDCLASS.

CLASS lhc_Headers IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

*  METHOD get_instance_authorizations.
*  ENDMETHOD.

  METHOD validateDates.
  ENDMETHOD.

  METHOD validateStatusOrder.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_Items DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS validateDates FOR VALIDATE ON SAVE
      IMPORTING keys FOR Items~validateDates.

ENDCLASS.

CLASS lhc_Items IMPLEMENTATION.

  METHOD validateDates.
  ENDMETHOD.

ENDCLASS.
