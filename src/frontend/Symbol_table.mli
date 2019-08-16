(** Symbol table interface to implement var map *)

type 'a state

val empty : 'a state
(** The empty symbol table *)

val enter : 'a state -> string -> 'a -> 'a state
(** Enters a specified identifier with its specified type (or other) information
    into a symbol table  *)

val look : 'a state -> string -> 'a option
(** Looks for an identifier in a symbol table and returns its information if found and None otherwise  *)

val begin_scope : 'a state -> 'a state
(** Used to start a new local scope which symbols added from now will end up in *)

val end_scope : 'a state -> 'a state
(** Used to end a local scope, purging the symbol table of all symbols added in that scope *)

val set_read_only : 'a state -> string -> 'a state
(** Used to add a read only label to an identifier *)

val get_read_only : 'a state -> string -> bool
(** Used to check for a read only label for an identifier *)

val set_is_assigned : 'a state -> string -> 'a state
(** Label an identifier as having been assigned to *)

val set_is_unassigned : 'a state -> string -> 'a state
(** Label an identifier as not having been assigned to *)

val check_is_unassigned : 'a state -> string -> bool
(** Check whether an identifier is labelled as unassigned *)

val check_some_id_is_unassigned : 'a state -> bool
(** Used to check whether some identifier is labelled as unassigned *)

val is_global : 'a state -> string -> bool
(** Used to check whether an identifier was declared in global scope *)
