PIXEL.RegisterFont("font22", "Roboto Medium", 22)

local PANEL = {}
AccessorFunc(PANEL, "Title", "Title", FORCE_STRING)

function PANEL:Init()
    self.headerH, self.spacing = PIXEL.Scale(30), PIXEL.Scale(6)
    self:DockPadding(0, self.headerH, 0, 0)
    self.CloseButton = vgui.Create("PIXEL.ImgurButton", self)
	self.CloseButton:SetImgurID("z1uAU0b")
	self.CloseButton:SetNormalColor(PIXEL.Colors.PrimaryText)
	self.CloseButton:SetHoverColor(PIXEL.Colors.Negative)
	self.CloseButton:SetClickColor(PIXEL.Colors.Negative)
	self.CloseButton:SetDisabledColor(PIXEL.Colors.DisabledText)
	self.CloseButton.DoClick = function(s)
		self:Remove()
	end
end

function PANEL:PerformLayout(w, h)
	if IsValid(self.CloseButton) then
		local btnSize = self.headerH * .45
		self.CloseButton:SetSize(btnSize, btnSize)
		self.CloseButton:SetPos(w - btnSize - self.spacing, (self.headerH - btnSize) / 2)
	end
end

function PANEL:Paint(w, h)
    PIXEL.DrawRoundedBox(self.spacing, 0, 0, w, h, Color(20, 20, 22))
    PIXEL.DrawRoundedBoxEx(self.spacing, 0, 0, w, self.headerH, Color(35, 35, 40), true, true)
end

function PANEL:ChangeTab(pnl)
    if IsValid(self.ContentPanel) then self.ContentPanel:Remove() end
    self.ContentPanel = self:Add(pnl)
    self.ContentPanel:Dock(FILL)
end

vgui.Register("White_PopupFrame", PANEL, "EditablePanel")