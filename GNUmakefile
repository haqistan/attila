# -*- makefile -*-
#

include gnumake/settings.mk
include gnumake/commands.mk

SUBDIRS?=bin lib dotfiles emacs
MAKESYS?=bsdmake BSDmakefile gnumake GNUmakefile

DIST_NAME=attila_env
DIST_VERS=1.0
DIST_TMP?=$(DIST_NAME)-$(DIST_VERS)
DIST_LIST?=$(MAKESYS) $(SUBDIRS)
DIST_TAR?=$(DIST_NAME)-$(DIST_VERS).tar
DIST_TAR_GZ?=$(DIST_TAR).gz

default: all

all install uninstall clean distclean::
	@(for dir in $(SUBDIRS); do (cd $$dir; $(MAKE) $(MFLAGS) S=$(S) MM=$(MM) $@); done)

distclean::
	$(RM) -f $(DIST_TAR) $(DIST_TAR_GZ)
	$(RM) -rf $(DIST_TMP)

xinstall:
	@(cd dotfiles; $(MAKE) $(MFLAGS) S=$(S) MM=$(MM) $@)

dist: distclean $(DIST_TAR_GZ)

$(DIST_TAR): $(DIST_TMP)
	$(TAR_CF) $(DIST_TAR) $(DIST_TMP)

$(DIST_TAR_GZ): $(DIST_TAR)
	$(GZIP) $(DIST_TAR)

$(DIST_TMP):
	$(MKDIR) -p $(DIST_TMP)
	($(TAR_CF) - $(DIST_LIST)) | (cd $(DIST_TMP); $(TAR_XF) -)
