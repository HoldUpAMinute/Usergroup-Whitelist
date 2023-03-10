util.AddNetworkString("Usergroup_Whitelist_21")
util.AddNetworkString("Usergroup_Configuration_Punishment")
util.AddNetworkString("Usergroup_Whitelist_UserAdded")
util.AddNetworkString("Usergroup_Whitelist_UserRemoved")
net.Receive("Usergroup_Whitelist_UserAdded", function()
    local p = net.ReadString()
    local x = player.GetBySteamID64(p)
    if not x:IsSuperAdmin() then print("u") return end
    local steamid = net.ReadString()
    local usergroup = net.ReadString()
    print(steamid)
    print(usergroup)
    RunConsoleCommand("whitelist_adduser_usingui", steamid, usergroup)
end)
net.Receive("Usergroup_Whitelist_UserRemoved", function()
    local p = net.ReadString()
    local x = player.GetBySteamID64(p)
    if not x:IsSuperAdmin() then print("u") return end
    local steamid = net.ReadString()
    oldUser = steamid
    pusergroup.userdata[oldUser] = nil
    userdatasave()
    print(oldUser .. " has been removed")
    RunConsoleCommand("sam", "setrankid", x:SteamID64(), "user")
end)