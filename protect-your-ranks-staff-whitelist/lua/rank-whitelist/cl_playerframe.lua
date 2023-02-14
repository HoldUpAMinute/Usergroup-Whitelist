PIXEL.RegisterFont("WMining_22", "Roboto Medium", 22)

local PANEL = {}
AccessorFunc(PANEL, "Title", "Title", FORCE_STRING)

function PANEL:Init()
    self.headerH, self.spacing = PIXEL.Scale(30), PIXEL.Scale(6)
    self:DockPadding(0, self.headerH, 0, 0)
end

function PANEL:PerformLayout(w, h)
	if IsValid(self.CloseButton) then
		local btnSize = self.headerH * .45
	end
end

function PANEL:Paint(w, h)
    PIXEL.DrawRoundedBox(self.spacing, 0, 0, w, h, Color(20, 20, 22))
    PIXEL.DrawRoundedBoxEx(self.spacing, 0, 0, w, self.headerH, Color(35, 35, 40), true, true)
end
vgui.Register("WMining_ItemFrame", PANEL, "EditablePanel")PIXEL.RegisterFont("WMining_22", "Roboto Medium", 22)

local PANEL = {}
AccessorFunc(PANEL, "Title", "Title", FORCE_STRING)

function PANEL:Init()
    self.headerH, self.spacing = PIXEL.Scale(30), PIXEL.Scale(6)
    self:DockPadding(0, self.headerH, 0, 0)
end

function PANEL:PerformLayout(w, h)
	if IsValid(self.CloseButton) then
		local btnSize = self.headerH * .45
	end
end

function PANEL:Paint(w, h)
    PIXEL.DrawRoundedBox(self.spacing, 0, 0, w, h, Color(20, 20, 22))
    PIXEL.DrawRoundedBoxEx(self.spacing, 0, 0, w, self.headerH, Color(35, 35, 40), true, true)
end
vgui.Register("White_PlayerFrame", PANEL, "EditablePanel")