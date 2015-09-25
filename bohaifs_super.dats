#define ATS_DYNLOADFLAG 0

#include "share/atspre_define.hats"
staload "{$LINUX}/SATS/init.sats"
staload "{$LINUX}/SATS/module.sats"
staload "{$LINUX}/SATS/kernel.sats"
staload $PRINTK

static fun bohaifs_init(): int = "mac#"
static fun bohaifs_fini(): void = "mac#"

implement
bohaifs_init () = 0 where {
  val () = $extfcall (void, "printk", KERN_ALERT_"bohaifs module loaded\n")
}

implement
bohaifs_fini () =
  $extfcall (void, "printk", KERN_ALERT_"bohaifs module unloaded\n")

%{$
module_init(bohaifs_init);
module_exit(bohaifs_fini);
MODULE_LICENSE("GPL");
MODULE_AUTHOR("Metasepi team");
%}
