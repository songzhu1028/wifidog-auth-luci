#
# Copyright (C) colin @2014
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=wifidog-auth
PKG_VERSION:=20141009
PKG_RELEASE=1


include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
  SUBMENU:=Captive Portals
  SECTION:=net
  CATEGORY:=Network
  TITLE:=wifidog auth server
  URL:=http://www.yodop.com/
  MAINTAINER:=Colin <colin.song@outlook.com>
  PKGARCH:=all
endef

define Package/$(PKG_NAME)/description
	The Wifidog project is a complete and embeddable captive
	portal solution for wireless community groups or individuals
	who wish to open a free Hotspot while still preventing abuse
	of their Internet connection.
endef

define Build/Compile
endef

define Build/Configure
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controler/$(PKG_NAME)/
	$(INSTALL_DATA) ./files/login.lua $(1)/usr/lib/lua/luci/controler/$(PKG_NAME)/
	$(INSTALL_DATA) ./files/auth.lua $(1)/usr/lib/lua/luci/controler/$(PKG_NAME)
	$(INSTALL_DATA) ./files/ping.lua $(1)/usr/lib/lua/luci/controler/$(PKG_NAME)
	$(INSTALL_DATA) ./files/portal.lua $(1)/usr/lib/lua/luci/controler/$(PKG_NAME)
	$(INSTALL_DATA) ./files/gw_message.lua $(1)/usr/lib/lua/luci/controler/$(PKG_NAME)

endef

$(eval $(call BuildPackage,$(PKG_NAME)))
