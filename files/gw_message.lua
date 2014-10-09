module("luci.controller.wifidog-auth.gw_message", package.seeall)

function index()
	entry({"auth","gw_message.php"}, call("message")).dependent=false
end

function message()
	--http://192.168.1.220/cgi-bin/luci/auth/gw_message.php?message=denied
	local msg= luci.http.formvalue("message")
	if (msg~="") then
		luci.http.write(msg)
	else
		luci.http.write([[<html><head></head><body>
		please install wifidog first;<br>
		then edit wiht command "vi /etc/wifidog.conf" like below, others could be default:<br>
		AuthServer {<br>
		Hostname 192.168.1.1<br>
		#Hostname should be the IP of the router, such as 192.168.1.1<br>
		Path /cgi-bin/luci/auth/<br>
		#Path is path of scipt's path.<br>
		}<br>
		</body></html>]])
	end

end
