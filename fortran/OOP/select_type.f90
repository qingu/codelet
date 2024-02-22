! Purpose: learn select_type construct 
PROGRAM p
  ! base class
  TYPE base
    INTEGER::i
  END TYPE

  ! inherit clas
  TYPE,EXTENDS(base)::child
    INTEGER::j
  END TYPE

  CLASS(base), POINTER :: bptr
  TYPE(base), TARGET :: base_target = base(10)
  TYPE(child), TARGET :: child_target = child(20, 30)
  integer,target :: i

  ! unlimited poly 
  CLASS(*), POINTER :: unlimited_ptr

  bptr => base_target

  SELECT type(bptr)
    TYPE IS (base)
    PRINT *, "base type: component value: ", bptr%i
    TYPE IS (child)
    PRINT *, "child type: component values: ", bptr%i, bptr%j
  END SELECT

  bptr => child_target

  SELECT type(bptr)
    TYPE IS (base)
    PRINT *, "base type: component value: ", bptr%i
    TYPE IS (child)
    PRINT *, "child type: component values: ", bptr%i, bptr%j
  END SELECT

  unlimited_ptr => base_target
  SELECT type(unlimited_ptr)
    TYPE IS (base)
    PRINT *, "base type: component value: ", unlimited_ptr%i
    TYPE IS (child)
    PRINT *, "child type: component values: ", unlimited_ptr%i,unlimited_ptr%j
  END SELECT

  unlimited_ptr => i
  SELECT type(unlimited_ptr)
    TYPE IS (base)
    PRINT *, "base type: component value: ", unlimited_ptr%i
    TYPE IS (child)
    PRINT *, "child type: component values: ", unlimited_ptr%i,unlimited_ptr%j
    TYPE IS (integer)
    PRINT *, "basic interger type"
  END SELECT
END PROGRAM p
