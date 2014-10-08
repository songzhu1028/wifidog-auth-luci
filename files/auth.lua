module("luci.controller.wifidog-auth.auth", package.seeall)

function index()
	entry({"auth","auth"}, call("validate")).dependent=false
end

function validate()
	--http://192.168.1.220/cgi-bin/luci/auth/auth/?stage=login&ip=192.168.1.104&mac=50:e5:49:5e:8d:2d&token=f3c58dd37b65f5e2ac8b089685b30d731412653965&incoming=0&outgoing=0&gw_id=080027F9A44E
	--local tempfile = io.open("/tmp/wifidog-auth/"..token, "w+")

	local token = luci.http.formvalue("token")
	if token then
		local file = io.open("/tmp/wifidog-auth/"..token)
		if file then
			nixio.fs.remove("/tmp/wifidog-auth/"..token)
			luci.http.write("Auth: 1")
		else
			luci.http.write("Auth: 0")
		end
	else
		luci.http.write("Auth: 0")
	end
end
