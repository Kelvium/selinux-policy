SELINUXTYPE ?= targeted
POLICIES    := \
	       myalsa.pp \
	       myavahi.pp \
	       myboot.pp \
	       mymisc.pp \
	       mypam.pp \
	       myportage.pp \
	       mywireguard.pp

.PHONY: all
all: $(POLICIES)

install: $(POLICIES)
	semodule -i $?

%.pp: %.te
	make -f /usr/share/selinux/$(SELINUXTYPE)/include/Makefile $@
