#
#   base.make
#
#   Makefile flags and configs to build with the base library.
#
#   Copyright (C) 2001 Free Software Foundation, Inc.
#
#   Author:  Nicola Pero <n.pero@mi.flashnet.it>
#   Based on code originally in the gnustep make package
#
#   This file is part of the GNUstep Base Library.
#
#   This library is free software; you can redistribute it and/or
#   modify it under the terms of the GNU General Public License
#   as published by the Free Software Foundation; either
#   version 2 of the License, or (at your option) any later version.
#   
#   You should have received a copy of the GNU General Public
#   License along with this library; see the file COPYING.LIB.
#   If not, write to the Free Software Foundation,
#   51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.

ifeq ($(BASE_MAKE_LOADED),)
BASE_MAKE_LOADED=yes

ifeq ($(FOUNDATION_LIB),gnu)
#
# FIXME - macro names
#
  AUXILIARY_OBJCFLAGS += -fconstant-string-class=NSConstantString
  ifeq ($(shared),no)
    CONFIG_SYSTEM_LIBS += -L/mingw/../devlibs/lib -lxml2 -lz -liconv -lws2_32 -liconv -lffi -lnettle -lhogweed -lgnutls -lgcrypt -lgpg-error -lgmp -lcrypt32 -lpthread -lz
    CONFIG_SYSTEM_LIB_DIR += -L/mingw/../devlibs/lib -L/mingw/../devlibs/gnustep1201/System/Library/Libraries -L/mingw/../devlibs/gnustep1201/Local/Library/Libraries -L/mingw/../devlibs/gnustep1201/Local/Library/Libraries -L/mingw/../devlibs/gnustep1201/System/Library/Libraries/gnu-gnu-gnu -L/mingw/../devlibs/gnustep1201/System/Library/Libraries -L/mingw/../devlibs/lib
  endif

  GNUSTEP_BASE_VERSION = 1.20.1
  GNUSTEP_BASE_MAJOR_VERSION = 1
  GNUSTEP_BASE_MINOR_VERSION = 20
  GNUSTEP_BASE_SUBMINOR_VERSION = 1

  FND_LDFLAGS =
  FND_LIBS = -lgnustep-base
  FND_DEFINE = -DGNUSTEP_BASE_LIBRARY=1
  GNUSTEP_DEFINE = -DGNUSTEP
else
#
# Not using the GNUstep foundation ... must be Apple's
# So we need to use the base additions library.
#
  FND_LIBS = -lgnustep-baseadd -framework Foundation
endif

  GNUSTEP_BASE_HAVE_GNUTLS=1
  GNUSTEP_BASE_HAVE_LIBXML=1
  GNUSTEP_BASE_HAVE_MDNS=0

endif # BASE_MAKE_LOADED
