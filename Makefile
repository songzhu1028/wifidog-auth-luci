#
# Copyright (C) 2006,2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=wifidog-auth
PKG_VERSION:=20141008
PKG_RELEASE=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/songzhu1028/wifidog-auth-luci
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE_VERSION:=440445db60b0c3aff528ea703a828b0567293387
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz

PKG_FIXUP:=autoreconf
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/wifidog-auth
  SUBMENU:=Captive Portals
  SECTION:=net
  CATEGORY:=Network
  TITLE:=wifidog auth server writed in lua
  URL:=http://www.wifidog.org
endef

define Package/wifidog-auth/description
	The Wifidog project is a complete and embeddable captive
	portal solution for wireless community groups or individuals
	who wish to open a free Hotspot while still preventing abuse
	of their Internet connection.
endef

define Package/wifidog-auth/install
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/login.lua $(1)/usr/lib/lua/luci/controler/$(PKG_NAME)/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/auth.lua $(1)/usr/lib/lua/luci/controler/$(PKG_NAME)
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/ping.lua $(1)/usr/lib/lua/luci/controler/$(PKG_NAME)
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/portal.lua $(1)/usr/lib/lua/luci/controler/$(PKG_NAME)
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/gw_message.lua $(1)/usr/lib/lua/luci/controler/$(PKG_NAME)

endef

$(eval $(call BuildPackage,wifidog-auth))
