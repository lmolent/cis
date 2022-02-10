PACKER ?= packer

.PHONY: all clean

all: ubuntu-cis.tar.gz

seeds-cis.iso: user-data-cis meta-data
	cloud-localds $@ $^

OVMF_VARS.fd: /usr/share/OVMF/OVMF_VARS.fd
	cp -v $< $@

ubuntu-cis.tar.gz: clean seeds-cis.iso OVMF_VARS.fd
	PACKER_LOG=0 ${PACKER} build ubuntu-cis.json

ubuntu-cis.raw: clean seeds-cis-lvm.iso OVMF_VARS.fd
	PACKER_LOG=0 ${PACKER} build ubuntu-cis-lvm.json

clean:
	${RM} -rf output-qemu custom-ubuntu*.gz

.INTERMEDIATE: OVMF_VARS.fd
