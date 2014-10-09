module("luci.controller.wifidog-auth.portal", package.seeall)

function index()
	entry({"auth","portal"}, call("redirect")).dependent=false
end

function redirect()
	--http://192.168.1.220/cgi-bin/luci/auth/portal/?gw_id=080027F9A44E
	--luci.http.write("http://www.baidu.com/")
	luci.http.redirect("http://www.baidu.com/")
end