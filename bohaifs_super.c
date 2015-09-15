#include <linux/init.h>
#include <linux/module.h>

static int __init bohaifs_init(void)
{
	printk("bohaifs module loaded\n");
	return 0;
}

static void __exit bohaifs_fini(void)
{
	printk("bohaifs module unloaded\n");
}

module_init(bohaifs_init);
module_exit(bohaifs_fini);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Metasepi team");
