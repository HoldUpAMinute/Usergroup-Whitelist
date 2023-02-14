hook.Add("InitPostEntity", "UserDataLoaded", function()
    userdataload()
end)

concommand.Add("whitelist_adduser_usingui", function(ply, _, args)
    if not ply:IsSuperAdmin() then return end
    NewUser = args[1]
    NewRank = args[2]
    pusergroup.userdata[NewUser] = NewRank
    userdatasave()
    print(NewUser .. " Has been added to " .. NewRank)
end)
concommand.Add("whitelist_removeuser_usingui", function(ply, _, args)
    oldUser = args[1]
    pusergroup.userdata[oldUser] = nil
    userdatasave()
    print(oldUser .. " has been removed")
end)
function whitelistrelay(msg)
        http.Post("urlhere", {
        title = "[Usergroup-Whitelist] User Tried To Set Rank.",
        bar_color = "#FF8C00",
        url = "",
        body = msg
    }, function(r)
        print(r)
    end, function(e)
        print(e)
    end)
end

function banalert(ply)
    for k,v in pairs(player.GetAll()) do
        v:ChatPrint("[{!Whitelist}] " .. ply:Nick() .. "/" .. ply:SteamID() .. " {*Was Banned}")
    end
end

hook.Add("SAM.ChangedPlayerRank", "Whitelist_Rank_Changed", function(pl, nrank, orank, dates)
    if nrank == "user" or nrank == "vip" or nrank == "vip+" then return end
          for k, v in pairs(pusergroup.userdata) do
            if not pusergroup.userdata[pl:SteamID()] and v == nrank then
                print("User will be terminated.")
                RunConsoleCommand("sam", "setrankid", pl:SteamID64(), "user")
                local msg = "['Usergroup Whitelist'] **%s** / **%s** was not authorized"
                msg = msg:format(pl:Nick(), pl:SteamID())
                for k,v in pairs(player.GetAll()) do
                v:ChatPrint("[{!Whitelist}] " .. pl:Nick() .. "/" .. pl:SteamID() .. " {*Was Banned}")
                end
                whitelistrelay( msg )
                sam.player.ban_id(pl:SteamID(), 0, "[Rank-Whitelist] not authorized access", "console")
                return
            end
            
            if pusergroup.userdata[pl:SteamID()] then
               if v == nrank then
                print("User is allowed.")
            end
        end
    end
end)