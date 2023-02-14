PIXEL.RegisterFont("WMining_Font22", "Roboto Medium", 22)
local PANEL = {}
AccessorFunc(PANEL, "Title", "Title", FORCE_STRING)

function PANEL:Init()
    self.headerH, self.spacing = PIXEL.Scale(30), PIXEL.Scale(6)
    self:DockPadding(0, self.headerH, 0, 0)
    self.CloseButton = false
    self.ScrollPanel = self:Add("PIXEL.ScrollPanel")
    self.ScrollPanel:Dock(FILL)
    for k, v in pairs(pusergroup.userdata) do
            print("------------------------------")
            print(RankName)
            Ranks:AddChoice(v)
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
    self:AddPlayer(_, _)
end
function PANEL:PerformLayout(w, h)
    if IsValid(self.CloseButton) then
        local btnSize = self.headerH * .45
        self.CloseButton:SetSize(btnSize, btnSize)
        self.CloseButton:SetPos(w - btnSize - self.spacing, (self.headerH - btnSize) / 2)
    end
end
function PANEL:AddPlayer(k, PlayerData)
        local Ranks = self:Add("PIXEL.TextEntry")
        Ranks:SetSize(400, 25)
        Ranks:SetPos(ScrW() * 0.02, ScrH() * 0.05)
        Ranks.OnEnter = function( self )
           net.Start("Usergroup_Whitelist_UserRemoved")
           net.WriteString(LocalPlayer():SteamID64())
           net.WriteString(self:GetValue())
        end
         local button = self:Add("PIXEL.TextButton") 
        button:SetText("Remove User")
        button:SetPos(0, ScrH() * 0.175)
        button:SetSize(500, 50)
        button.DoClick = function()
            net.SendToServer()
        end
end

vgui.Register("White_CurrentStaff", PANEL, "EditablePanel")