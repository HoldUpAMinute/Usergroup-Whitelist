hook.Add("PlayerAuthed", "UserDataLoaded", function()
    userdataload()
end)

function userdataload()
    local udata = file.Read("staff_whitelist/userdata.txt", "DATA")
    if not udata then print("[Error!] No data was saved.") return end
    pusergroup.userdata = util.JSONToTable(udata)
    print("[Rank-Whitelist] User data was loaded!")
end

function userdatasave()
    if not file.Exists("staff_whitelist", "DATA") then 
        file.CreateDir("staff_whitelist")
    end
    file.Write("staff_whitelist/userdata.txt", util.TableToJSON(pusergroup.userdata, true))
    print("[Rank Protection] Data Saved Succesfully.")
end

function commanddataload()
    local udata = file.Read("staff_whitelist/commanddata.txt", "DATA")
    if not udata then print("[Error!] No data was saved.") return end
    pusergroup.commanddata = util.JSONToTable(data)
    print("[Rank-Whitelist] Command data was loaded!")
end

function commanddatasave(data)
    if not file.Exists("staff_whitelist", "DATA") then 
        file.CreateDir("staff_whitelist")
    end
    file.Write("staff_whitelist/commanddata.txt", util.TableToJSON(data, true))
    print("[Rank Protection] Command Data Saved Succesfully.")
end

function punishmentdataload()
    local udata = file.Read("staff_whitelist/punishmentdata.txt", "DATA")
    if not udata then print("[Error!] No data was saved.") return end
    pusergroup.punishmentdata = util.JSONToTable(data)
    print("[Rank-Whitelist] Punishment data was loaded!")
end

function punishmentdatasave(data)
    if not file.Exists("staff_whitelist", "DATA") then 
        file.CreateDir("staff_whitelist")
    end
    file.Write("staff_whitelist/punishmentdata.txt", util.TableToJSON(data, true))
    print("[Rank Protection] Punishment Data Saved Succesfully.")
end

function adminaddondataload()
    local udata = file.Read("staff_whitelist/adminmodedata.txt", "DATA")
    if not udata then print("[Error!] No data was saved.") return end
    pusergroup.admindata = util.JSONToTable(data)
    print("[Rank-Whitelist] Admin Addon data was loaded!")
end

function adminaddondatasave(data)
    if not file.Exists("staff_whitelist", "DATA") then 
        file.CreateDir("staff_whitelist")
    end
    file.Write("staff_whitelist/adminmodedata.txt", util.TableToJSON(data, true))
    print("[Rank Protection] Admin Addon Data Saved Succesfully.")
end
function configdataload()
    local udata = file.Read("staff_whitelist/configdata.txt", "DATA")
    if not udata then print("[Error!] No data was saved.") return end
    tableddata = util.JSONToTable(data)
    print("[Rank-Whitelist] Config data was loaded!")
end

function configdatasave(data)
    if not file.Exists("staff_whitelist", "DATA") then 
        file.CreateDir("staff_whitelist")
    end
    file.Write("staff_whitelist/configdata.txt", util.TableToJSON(data, true))
    print("[Rank Protection] Config Data Saved Succesfully.")
end