PIXEL.RegisterFont("font22", "Roboto Medium", 22)
PIXEL.RegisterFont("font30", "Roboto Medium", 30)
local PANEL = {}
AccessorFunc(PANEL, "Title", "Title", FORCE_STRING)
local function DrawRainbowText( frequency, str, font, x, y )

	surface.SetFont( font )
	surface.SetTextPos( x, y )

	for i = 1, #str do
		local col = HSVToColor( i * frequency % 360, 1, 1 ) -- Providing 3 numbers to surface.SetTextColor rather
		surface.SetTextColor( col.r, col.g, col.b )			-- than a single color is faster
		surface.DrawText( string.sub( str, i, i ) )
	end

end

function PANEL:Init()
    self.headerH, self.spacing = PIXEL.Scale(30), PIXEL.Scale(6)
    self:DockPadding(0, self.headerH, 0, 0)
    local playerselection = self:Add("PIXEL.ComboBox")
    playerselection:SetSizeToText(false)
    playerselection:SetText("Punishment")
    playerselection:AddChoice("Ban")
    playerselection:AddChoice("Kick")
    playerselection:AddChoice("None")
    playerselection:SetSize(500, 25)
    playerselection:SetPos(ScrW() * 0.0, ScrH() * 0.05)
	DrawRainbowText( 10, "Hello world! This is rainbow text.", "CloseCaption_Bold", 0, 0 )

    playerselection.OnSelect = function( self, index, value )
    print(index)
        net.Start("Usergroup_Configuration_Punishment")
        net.WriteString(index)
        net.SendToServer()
    end

    function PANEL:PerformLayout(w, h)
        if IsValid(self.CloseButton) then
            local btnSize = self.headerH * .45
            self.CloseButton:SetSize(btnSize, btnSize)
            self.CloseButton:SetPos(w - btnSize - self.spacing, (self.headerH - btnSize) / 2)
        end
    end

    function PANEL:Paint(w, h)
    end

    function PANEL:ChangeTab(pnl)
        if IsValid(self.ContentPanel) then
            self.ContentPanel:Remove()
        end

        self.ContentPanel = self:Add(pnl)
        self.ContentPanel:Dock(FILL)
    end
end
vgui.Register("White_Config", PANEL, "EditablePanel")