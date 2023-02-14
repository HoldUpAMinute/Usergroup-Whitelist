PIXEL.RegisterFont("font22", "Roboto Medium", 22)

local PANEL = {}
AccessorFunc(PANEL, "Title", "Title", FORCE_STRING)

function PANEL:Init()
    self.headerH, self.spacing = PIXEL.Scale(30), PIXEL.Scale(6)
    self:DockPadding(0, self.headerH, 0, 0)
end

function PANEL:PerformLayout(w, h)
	if IsValid(self.CloseButton) then
		local btnSize = self.headerH * .45
		self.CloseButton:SetSize(btnSize, btnSize)
		self.CloseButton:SetPos(w - btnSize - self.spacing, (self.headerH - btnSize) / 2)
	end
end

function PANEL:Paint(w, h)
    PIXEL.DrawSimpleText("Usergroup Whitelist Welcome " .. LocalPlayer():Nick(), "font22", 0 + self.spacing, self.headerH/2, color_white, nil, TEXT_ALIGN_CENTER)
end

function PANEL:ChangeTab(pnl)
    if IsValid(self.ContentPanel) then self.ContentPanel:Remove() end
    self.ContentPanel = self:Add(pnl)
    self.ContentPanel:Dock(FILL)
end
vgui.Register("White_Home", PANEL, "EditablePanel")