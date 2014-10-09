#
# Copyright (C) colin @2014
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
#makefile refer to : package/network/utils/iwcap/
include $(TOPDIR)/rules.mk

PKG_NAME:=wifidog-auth
PKG_VERSION:=20141009
PKG_RELEASE=1

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SUBMENU:=Captive Portals
  SECTION:=net
  CATEGORY:=Network
  TITLE:=wifidog authenticate server
  URL:=http://www.yodop.com/
  MAINTAINER:=Colin <colin.song@outlook.com>
  PKGARCH:=all
endef

define Package/$(PKG_NAME)/description
	This is a wifidog Authentication server writed in lua language.
	It run under luci, shoud install luci and wifidog first.
endef

define Build/Compile
endef

define Build/Configure
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller/$(PKG_NAME)/
	$(CP) ./files/*.lua $(1)/usr/lib/lua/luci/controller/$(PKG_NAME)/
#	$(INSTALL_DATA) ./files/*.lua $(1)/usr/lib/lua/luci/controler/$(PKG_NAME)

endef

$(eval $(call BuildPackage,$(PKG_NAME)))