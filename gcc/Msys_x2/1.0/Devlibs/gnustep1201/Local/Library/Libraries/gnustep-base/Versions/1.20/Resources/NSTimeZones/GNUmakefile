#
#  Copyright (C) 2000 Free Software Foundation, Inc.
#
#  Written by:	Richard Frith-Macdonald <richard@brainstorm.co.uk>
#
#  This file is part of the GNUstep Base Library.
#
#  This library is free software; you can redistribute it and/or
#  modify it under the terms of the GNU Library General Public
#  License as published by the Free Software Foundation; either
#  version 2 of the License, or (at your option) any later version.
#
#  This library is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
#  Library General Public License for more details.
#
#  You should have received a copy of the GNU Library General Public
#  License along with this library; if not, write to the Free
#  Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02111, USA.
#

GNUSTEP_MAKEFILES = $(GNUSTEP_SYSTEM_ROOT)/Library/Makefiles

include $(GNUSTEP_MAKEFILES)/common.make

# The tools to be compiled
TOOL_NAME = \
create-abbrevs \
create-regions

# The tool Objective-C source files to be compiled
create-abbrevs_OBJC_FILES = create-abbrevs.m
create-regions_OBJC_FILES = create-regions.m

include $(GNUSTEP_MAKEFILES)/tool.make

after-distclean::
	rm -rf localtime
