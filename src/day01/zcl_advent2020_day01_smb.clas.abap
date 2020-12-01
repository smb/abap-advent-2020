CLASS zcl_advent2020_day01_smb DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_advent2020_smb.
  PROTECTED SECTION.
    METHODS part1
      IMPORTING
        input TYPE string
      RETURNING VALUE(output) TYPE string.
    METHODS part2
      IMPORTING
        input TYPE string
      RETURNING VALUE(output) TYPE string.

    CONSTANTS magic_sum TYPE i VALUE '2020'.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_advent2020_day01_smb IMPLEMENTATION.

  METHOD zif_advent2020_smb~solve.
    " output = part1( input ).
    output = part2( input ).
  ENDMETHOD.

  METHOD part1.
    SPLIT input AT cl_abap_char_utilities=>cr_lf INTO TABLE DATA(inputtab).
    LOOP AT inputtab INTO DATA(string1).
      LOOP AT inputtab INTO DATA(string2) WHERE table_line <> string1.
        IF string1 + string2 = magic_sum.
          output = string1 * string2.
          RETURN.
        ENDIF.
      ENDLOOP.
    ENDLOOP.
  ENDMETHOD.

  METHOD part2.
    SPLIT input AT cl_abap_char_utilities=>cr_lf INTO TABLE DATA(inputtab).
    LOOP AT inputtab INTO DATA(string1).
      LOOP AT inputtab INTO DATA(string2) WHERE table_line <> string1.
        LOOP AT inputtab INTO DATA(string3) WHERE table_line <> string1 AND table_line <> string2.
          IF string1 + string2 + string3 = magic_sum.
            output = string1 * string2 * string3.
            RETURN.
          ENDIF.
        ENDLOOP.
      ENDLOOP.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
