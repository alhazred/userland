#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the
# Common Development and Distribution License (the "License").
# You may not use this file except in compliance with the License.
#
# You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
# or http://www.opensolaris.org/os/licensing.
# See the License for the specific language governing permissions
# and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each
# file and include the License file at usr/src/OPENSOLARIS.LICENSE.
# If applicable, add the following below this CDDL HEADER, with the
# fields enclosed by brackets "[]" replaced with your own identifying
# information: Portions Copyright [yyyy] [name of copyright owner]
#
# CDDL HEADER END
#
# Copyright (c) 2011, 2012, Oracle and/or its affiliates. All rights reserved.
#
include ../../make-rules/shared-macros.mk

COMPONENT_NAME=		lua
COMPONENT_VERSION=	5.2.1
COMPONENT_PROJECT_URL=	http://www.lua.org/
COMPONENT_SRC=		$(COMPONENT_NAME)-$(COMPONENT_VERSION)
COMPONENT_ARCHIVE=	$(COMPONENT_SRC).tar.gz
COMPONENT_ARCHIVE_HASH=	\
    sha256:64304da87976133196f9e4c15250b70f444467b6ed80d7cfd7b3b982b5177be5
COMPONENT_ARCHIVE_URL=	$(COMPONENT_PROJECT_URL)ftp/$(COMPONENT_ARCHIVE)
COMPONENT_BUGDB=	utility/lua

LUA_TESTS=		lua-5.2.1-tests
COMPONENT_ARCHIVE_1=	$(LUA_TESTS).tar.gz
COMPONENT_ARCHIVE_HASH_1= \
    sha256:2346d635ee392c8d8024b07beaa10b7b66a3f861c41d575753d03155751cf114
COMPONENT_ARCHIVE_URL_1= $(COMPONENT_PROJECT_URL)/tests/5.2/$(COMPONENT_ARCHIVE_1)


include ../../make-rules/prep.mk
include ../../make-rules/justmake.mk
include ../../make-rules/ips.mk

PATCH_LEVEL= 0

# This is because lua uses $(CC) to build it's shared libraries.
CC +=		$(CC_BITS)

CFLAGS +=	$(CC_PIC) $(CPP_LARGEFILES)

COMPONENT_BUILD_ARGS += CC="$(CC)"
COMPONENT_BUILD_ARGS += USRCFLAGS="$(CFLAGS)"
COMPONENT_INSTALL_ARGS += INSTALL=$(INSTALL)
COMPONENT_INSTALL_ARGS += INSTALL_TOP=$(PROTOUSRDIR)
$(INSTALL_64):	COMPONENT_INSTALL_ARGS += INSTALL_LIB=$(PROTOUSRLIBDIR64)
$(INSTALL_64):	COMPONENT_INSTALL_ARGS += INSTALL_BIN=$(PROTOUSRBINDIR64)

# common targets
build:		$(BUILD_32_and_64)
	
install:	$(INSTALL_32_and_64)
		
test: 		install
		(gzip -dc $(LUA_TESTS).tar.gz | tar xopf -; \
		cd $(LUA_TESTS); $(ENV) LD_LIBRARY_PATH=$(PROTOUSRLIBDIR) \
		$(PROTOUSRBINDIR)/$(COMPONENT_NAME) -e"_U=true" all.lua; \
		$(ENV) LD_LIBRARY_PATH=$(PROTOUSRLIBDIR64) \
		$(PROTOUSRBINDIR64)/$(COMPONENT_NAME) -e"_U=true" all.lua)

BUILD_PKG_DEPENDENCIES =        $(BUILD_TOOLS)

include ../../make-rules/depend.mk

