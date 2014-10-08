module("luci.controller.wifidog-auth.ping", package.seeall)

function index()
	entry({"auth","ping"}, call("response")).dependent=false
end

function response()
	--auth/ping/?gw_id=080027F9A44E&sys_uptime=4228&sys_memfree=888124&sys_load=0.00&wifidog_uptime=3142
	luci.http.write("Pong")
end
