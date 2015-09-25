DATS  := bohaifs_super.dats
DATSC := $(patsubst %.dats,%_dats.c,${DATS})
DATSO := $(patsubst %.dats,%_dats.o,${DATS})

BUILD := /lib/modules/$(shell uname -r)/build

PATSOPT=${PATSHOME}/bin/patsopt

EXTRA_CFLAGS += -Wno-strict-prototypes -Wno-unused-label
EXTRA_CFLAGS += -D_ATS_CCOMP_HEADER_NONE_
EXTRA_CFLAGS += -D_ATS_CCOMP_PRELUDE_NONE_
EXTRA_CFLAGS += -D_ATS_CCOMP_PRELUDE_USER_=\"linux/H/pats_ccomp.h\"
EXTRA_CFLAGS += -D_ATS_CCOMP_PRELUDE_USER2_=\"linux/H/pats_ccomp2.h\"
EXTRA_CFLAGS += -D_ATS_CCOMP_EXCEPTION_NONE_
EXTRA_CFLAGS += -I${PATSHOMERELOC}/contrib

#CFLAGS_bohaifs_super.o := -DDEBUG

obj-m := bohaifs.o
bohaifs-objs := $(DATSO)

all: $(DATSC)
	$(MAKE) -C $(BUILD) M=$(PWD) modules

clean:
	rm -f *_dats.c *.tmp
	$(MAKE) -C $(BUILD) M=$(PWD) clean

%_dats.c: %.dats
	$(PATSOPT) -o $@.tmp --dynamic $<
	cp $@.tmp $@
