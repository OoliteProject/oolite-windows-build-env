#
# Extra make variables for base library
#
# Copyright (C) 2005-2010 Free Software Foundation
# Copying and distribution of this file, with or without modification,
# are permitted in any medium without royalty provided the copyright
# notice and this notice are preserved.

WHOAMI=/c/windows/system32/whoami

DYNAMIC_LINKER=win32

HAVE_LIBXML=1
HAVE_GNUTLS=1

WITH_FFI=libffi

NX_CONST_STRING_CLASS=NSConstantString
OBJCFLAGS+=-fgnu-runtime
OBJC2RUNTIME=0
OBJCSYNC=0
WARN_FLAGS=-Wall -Wdeclaration-after-statement

HAVE_INET_PTON=no
HAVE_INET_NTOP=no
HAVE_OBJC_SYNC_ENTER=no

CONFIG_SYSTEM_INCL += -I/mingw/../devlibs/include -mtune=generic -I/mingw/../devlibs/gnustep1201/System/Library/Headers -I/mingw/../devlibs/gnustep1201/Local/Library/Headers -I/mingw/../devlibs/gnustep1201/Local/Library/Headers -I/mingw/../devlibs/gnustep1201/System/Library/Headers -I/mingw/../devlibs/include -I/mingw/../devlibs/include/libxml2 -no-pthread
ifeq ($(shared),yes)
  CONFIG_SYSTEM_LIBS += -L/mingw/../devlibs/lib -lxml2 -lz -liconv -lws2_32 -liconv -lffi -lnettle -lhogweed -lgnutls -lgcrypt -lgpg-error -lgmp -lcrypt32 -lpthreadGC -lz -no-pthread
  CONFIG_SYSTEM_LIB_DIR += -L/mingw/../devlibs/lib -L/mingw/../devlibs/gnustep1201/System/Library/Libraries -L/mingw/../devlibs/gnustep1201/Local/Library/Libraries -L/mingw/../devlibs/gnustep1201/Local/Library/Libraries -L/mingw/../devlibs/gnustep1201/System/Library/Libraries/gnu-gnu-gnu -L/mingw/../devlibs/gnustep1201/System/Library/Libraries -L/mingw/../devlibs/lib
endif

GNUSTEP_INSTALL_GDOMAP_AS_SETUID=no

GNUSTEP_BASE_HAVE_LIBXML=1
GNUSTEP_BASE_HAVE_GNUTLS=1

# Default to building only -baseadd
# on non *-gnu-* library combos
ifneq ($(FOUNDATION_LIB),gnu)
add=yes
base=no
endif

GNUSTEP_BASE_DOMAIN=LOCAL
GNUSTEP_BASE_RELATIVE_PATHS=yes

ifeq ($(GNUSTEP_BASE_RELATIVE_PATHS), yes)
ifneq ($(GNUSTEP_BASE_DOMAIN), $(GNUSTEP_INSTALLATION_DOMAIN))
$(warning "Error: GNUSTEP_INSTALLATION_DOMAIN does not match GNUSTEP_BASE_DOMAIN")
$(warning " ")
$(warning "You can install gnustep-base in one of the four domains: SYSTEM, LOCAL, NETWORK or USER.")
$(warning " ")
$(warning "gnustep-base was configured to be installed into: $(GNUSTEP_BASE_DOMAIN)")
$(warning "but it would now being installed into: $(GNUSTEP_INSTALLATION_DOMAIN)")
$(warning "That's not right: they must match.")
$(warning " ")
$(warning "If you want to install into $(GNUSTEP_BASE_DOMAIN), please use")
$(warning " ")
$(warning "   make install GNUSTEP_INSTALLATION_DOMAIN=$(GNUSTEP_BASE_DOMAIN) [plus any other options you need]")
$(warning " ")
$(warning "Instead, if you want to install into $(GNUSTEP_INSTALLATION_DOMAIN), please reconfigure")
$(warning "gnustep-base by doing")
$(warning " ")
$(warning "   ./configure --with-installation-domain=$(GNUSTEP_INSTALLATION_DOMAIN) [plus any other options you need]")
$(warning " ")
$(warning "and then recompile and reinstall.")

# We used to automatically rerun configure here.  Unfortunately we
# don't know if the right domain that we should be installing into is
# GNUSTEP_BASE_DOMAIN (specified or automatically picked up by
# configure) or GNUSTEP_INSTALLATION_DOMAIN (specified or
# automatically picked up by make install) so the user really has to
# spend two minutes checking this and fixing it herself.

$(error "Please fix the installation domain then try again.  If you are stuck, contact discuss-gnustep@gnu.org for help.")
endif
endif
