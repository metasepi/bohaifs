BUILD := /lib/modules/$(shell uname -r)/build

obj-m := bohaifs.o
bohaifs-objs := bohaifs_super.o

#CFLAGS_bohaifs_super.o := -DDEBUG

all:
	$(MAKE) -C $(BUILD) M=$(PWD) modules

clean:
	$(MAKE) -C $(BUILD) M=$(PWD) clean
