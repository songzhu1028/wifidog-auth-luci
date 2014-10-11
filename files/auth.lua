module("luci.controller.wifidog-auth.auth", package.seeall)

function index()
	entry({"auth","auth"}, call("validate")).dependent=false
end

function validate()
	--http://192.168.1.163/cgi-bin/luci/auth/auth/?stage=login&ip=192.168.1.104&mac=50:e5:49:5e:8d:2d&token=b2aa402babe780a8d4fa4a536f517c68&incoming=0&outgoing=0&gw_id=080027F9A44E
	local token = luci.http.formvalue("token")
	if token then
		local file = io.open("/tmp/wifidog-auth/"..token)
		if file then
			local timeauth=file:read("*l")
			if not timeauth or timeauth-os.time()>3600*2 then
				file:close()
				os.remove("/tmp/wifidog-auth/"..token)
				luci.http.write("Auth: 0")
			else
				luci.http.write("Auth: 1")
			end
		else
			luci.http.write("Auth: 0")
		end
	else
		luci.http.write("Auth: 0")
	end
end
