-- DONT TOUCH ANY OF THIS 

concommand.Add("rankwhitelist", function(ply, _, args)
    if not pusergroup.admindata then pusergroup.admindata = "sam" end
end)
concommand.Add("openrankmenu", function(ply, _, _) if not ply:IsSuperAdmin() then ply:ChatPrint("{*User Not Authorized}") return end Rank_Whitelist_Menu() end)
function Rank_Whitelist_Menu()
    whitelistframe = vgui.Create("White_Frame")
    whitelistframe:SetTitle("Usergroup Whitelist Welcome ".. LocalPlayer():Nick())
    whitelistframe:SetSize(500, 700)
    whitelistframe:Center()
    whitelistframe:MakePopup()
end
concommand.Add("testing", function(_, _, _)
    print(pusergroup.userdata)
    PrintTable(pusergroup.userdata or "testing")
end)