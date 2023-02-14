PIXEL.RegisterFont("WMining_Font22", "Roboto Medium", 22)
local PANEL = {}
AccessorFunc(PANEL, "Title", "Title", FORCE_STRING)

function PANEL:Init()
    self.headerH, self.spacing = PIXEL.Scale(30), PIXEL.Scale(6)
    self:DockPadding(0, self.headerH, 0, 0)
    self.CloseButton = false
    self.ScrollPanel = self:Add("PIXEL.ScrollPanel")
    self.ScrollPanel:Dock(FILL)
    for k, PlayerData in pairs(player.GetAll()) do
        self:AddPlayer(k, PlayerData)
    end
end
function PANEL:PerformLayout(w, h)
    if IsValid(self.CloseButton) then
        local btnSize = self.headerH * .45
        self.CloseButton:SetSize(btnSize, btnSize)
        self.CloseButton:SetPos(w - btnSize - self.spacing, (self.headerH - btnSize) / 2)
    end
end
function PANEL:AddPlayer(k, PlayerData)
    players = self.ScrollPanel:Add("White_PlayerFrame")
    players:DockMargin(0.5, 0.5, 0.5, 0.5)
    players:Dock(TOP)
    players:SetTall(ScrH() * 0.09)
    players.Paint = function(self2, w, h)
    PIXEL.DrawRoundedBox(20, 5, 5, w, h, Color(255, 255, 255))
    PIXEL.DrawSimpleText(PlayerData:Nick() or "nil", "font22", w * 0.15, h * 0.15, Color(0,0,0), nil, TEXT_ALIGN_CENTER)
    PIXEL.DrawSimpleText(PlayerData:SteamID() or "nil", "font22", w * 0.1, h * 0.325, Color(0,0,0), nil, TEXT_ALIGN_CENTER)
    PIXEL.DrawSimpleText(PlayerData:GetUserGroup() or "nil", "font22", w * 0.135, h * 0.5, Color(0,0,0), nil, TEXT_ALIGN_CENTER)
    end
    local button = vgui.Create("PIXEL.TextButton", players) 
    button:SetText("Add User")
    button:SetSize(100, 95)
    button:SetPos(ScrW() * 0.2090, ScrH() * 0.005)
    button.OnClick = function()
    end
end
PIXEL.RegisterFont("WMining_Font22", "Roboto Medium", 22)
local PANEL = {}
AccessorFunc(PANEL, "Title", "Title", FORCE_STRING)

function PANEL:Init()
    self.headerH, self.spacing = PIXEL.Scale(30), PIXEL.Scale(6)
    self:DockPadding(0, self.headerH, 0, 0)
    self.CloseButton = false
    self.ScrollPanel = self:Add("PIXEL.ScrollPanel")
    self.ScrollPanel:Dock(FILL)
    for k, PlayerData in pairs(player.GetAll()) do
        print(PlayerData:SteamID())
        print(PlayerData:Nick())
        self:AddPlayer(k, PlayerData)
    end
end
function PANEL:PerformLayout(w, h)
    if IsValid(self.CloseButton) then
        local btnSize = self.headerH * .45
        self.CloseButton:SetSize(btnSize, btnSize)
        self.CloseButton:SetPos(w - btnSize - self.spacing, (self.headerH - btnSize) / 2)
    end
end
function PANEL:AddPlayer(k, PlayerData)
    players = self.ScrollPanel:Add("White_PlayerFrame")
    players:DockMargin(0.5, 0.5, 0.5, 0.5)
    players:Dock(TOP)
    players:SetTall(ScrH() * 0.09)
    players.Paint = function(self2, w, h)
    PIXEL.DrawRoundedBox(20, 5, 5, w, h, Color(28,28,28))
    PIXEL.DrawSimpleText(PlayerData:Nick() or "nil", "font22", w * 0.1, h * 0.15, Color(255,255,255), nil, TEXT_ALIGN_CENTER)
    PIXEL.DrawSimpleText(PlayerData:SteamID() or "nil", "font22", w * 0.1, h * 0.325, Color(255,255,255), nil, TEXT_ALIGN_CENTER)
    PIXEL.DrawSimpleText(PlayerData:GetUserGroup() or "nil", "font22", w * 0.1, h * 0.5, Color(255,255,255), nil, TEXT_ALIGN_CENTER)
    end
    local button = vgui.Create("PIXEL.TextButton", players) 
    button:SetText("Add User")
    button:SetSize(100, 95)
    button:SetPos(ScrW() * 0.2090, ScrH() * 0.005)
    button.DoClick = function()
        local playerinfomenu = vgui.Create("White_PopupFrame")
        playerinfomenu:SetSize(250, 250)
        playerinfomenu:SetPos(ScrW() * 0.635, ScrH() * 0.175)
        local playerselection = vgui.Create("PIXEL.ComboBox", playerinfomenu)
        for _, v in pairs(player.GetAll()) do
            playerselection:AddChoice(v:SteamID())
        end
        playerselection:SetSize(250, 250)
        playerselection:SetPos(ScrW() * 0.02, ScrH() * 0.08)
        playerselection.OnSelect = function(self,index,value)
           net.Start("Usergroup_Whitelist_UserAdded")
           net.WriteString(LocalPlayer():SteamID64())
           net.WriteString(value)
        end
        local Ranks = vgui.Create("PIXEL.ComboBox", playerinfomenu)
        for RankName, v in pairs(sam.ranks.get_ranks()) do
            Ranks:AddChoice(RankName)
        end
        Ranks:SetSize(250, 250)
        Ranks:SetPos(ScrW() * 0.02, ScrH() * 0.12)
        Ranks.OnSelect = function(self,index,value)
           net.WriteString(value)
        end
         local button = vgui.Create("PIXEL.TextButton", playerinfomenu) 
        button:SetText("Whitelist User")
        button:Dock(BOTTOM)
        button:SetSize(25, 50)
        button.DoClick = function()
            net.SendToServer()
        end
    end
end

vgui.Register("White_AddUser", PANEL, "EditablePanel")