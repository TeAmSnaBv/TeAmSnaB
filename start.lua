Create_1 = dofile("./File_Libs/serpent.lua")
Create_2 = require("ssl.https")
Create_4 = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a')
local Create_3 = dofile("./File_Libs/redis.lua").connect("127.0.0.1", 6379)
local Create_5 = function() 
local Create_6 = function(Token,Sudo)  
local Create_7 = io.open("sudo.lua", 'w')
Create_7:write([[
token = "]]..Token..[["

Sudo = ]]..Sudo..[[  
]])
Create_7:close()
end  
if not Create_3:get(Create_4.."Token_TeAmSnaB") then
print("\27[1;34m»» Send Your Token Bot :\27[m")
local token = io.read()
if token ~= '' then
local url , res = Create_2.request('https://api.telegram.org/bot'..token..'/getMe')
if res ~= 200 then
io.write('\n\27[1;31m»» Sorry The Token is not Correct \n\27[0;39;49m')
else
io.write('\n\27[1;31m»» The Token Is Saved\n\27[0;39;49m')
Create_3:set(Create_4.."Token_TeAmSnaB",token)
end 
else
io.write('\n\27[1;31mThe Tokem was not Saved\n\27[0;39;49m')
end 
os.execute('lua start.lua')
end
if not Create_3:get(Create_4.."Id_TeAmSnaB") then
print("\27[1;34m\n»» Send Your id Sudo : \27[m")
local Id = io.read():gsub(' ','') 
if tostring(Id):match('%d+') then
io.write('\n\27[1;31m»» The id Is Saved\n\27[0;39;49m')
Create_3:set(Create_4.."Id_TeAmSnaB",Id)
io.write('\n\27[1;31m»» Sorry The id is not Correct \n\27[0;39;49m')
os.execute('lua start.lua')
end
end
local function Files_TeAmSnaB_Info()
Create_6(Create_3:get(Create_4.."Token_TeAmSnaB"),Create_3:get(Create_4.."Id_TeAmSnaB"))   
local RunTeAmSnaB = io.open("TeAmSnaB", 'w')
RunTeAmSnaB:write([[
#!/usr/bin/env bash
cd $HOME/TeAmSnaB
token="]]..Create_3:get(Create_4.."Token_TeAmSnaB")..[["
rm -fr TeAmSnaB.lua
wget "https://raw.githubusercontent.com/TeAmSnaBv/TeAmSnaB/master/TeAmSnaB.lua"
while(true) do
rm -fr ../.telegram-cli
./tg -s ./TeAmSnaB.lua -p PROFILE --bot=$token
done
]])
RunTeAmSnaB:close()
local RunTs = io.open("Run", 'w')
RunTs:write([[
#!/usr/bin/env bash
cd $HOME/TeAmSnaB
while(true) do
rm -fr ../.telegram-cli
screen -S TeAmSnaB -X kill
screen -S TeAmSnaB ./TeAmSnaB
done
]])
RunTs:close()
end
Files_TeAmSnaB_Info()
Create_3:del(Create_4.."Token_TeAmSnaB")
Create_3:del(Create_4.."Id_TeAmSnaB")
sudos = dofile('sudo.lua')
os.execute('./install.sh ins')
end 
local function Load_File()  
local f = io.open("./sudo.lua", "r")  
if not f then   
Create_5()  
var = true
else   
f:close()  
Create_3:del(Create_4.."Token_TeAmSnaB")
Create_3:del(Create_4.."Id_TeAmSnaB")
sudos = dofile('sudo.lua')
os.execute('./install.sh ins')
var = false
end  
return var
end
Load_File()
