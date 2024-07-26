local sBannerPath = THEME:GetPathG("Common", "fallback banner");
local sJacketPath = THEME:GetPathG("Common", "fallback jacket");
local bAllowJackets = true

local t = Def.ActorFrame {
	Def.Sprite {
		Name="Banner";
		-- Set em up the graphics.
		SetMessageCommand=function(self,params)
			if params.Type == "Course" then
				local Song = params.Song;
				local Course = params.Course;
				-- We have a song, not course
				if Song then
					-- Have Jacket
					if ( Song:GetJacketPath() ~=  nil ) and ( bAllowJackets ) then
						self:Load( Song:GetJacketPath() );
					-- Use Background if we want Jackets
					elseif ( Song:GetBackgroundPath() ~= nil ) and ( bAllowJackets ) then
						self:Load( Song:GetBackgroundPath() );
					-- Use Banner if we dont care 
					elseif ( Song:GetBannerPath() ~= nil ) then
						self:Load( Song:GetBannerPath() );
					-- Use Default
					else
					  self:Load( bAllowJackets and sBannerPath or sJacketPath );
					  self:playcommand( bAllowJackets and "Jacket" or "Banner" );
					end;
				elseif Course then
					-- We have a background (for jackets) 
					if ( Course:GetBackgroundPath() ~= nil ) and ( bAllowJackets ) then
						self:Load( Course:GetBackgroundPath() );
					-- We have a banner
					elseif ( Course:GetBannerPath() ~= nil ) then
						self:Load( Course:GetBannerPath() );
					-- Get your defaults
					else
						self:Load( sJacketPath );
					end
				-- What the hell did you do?! 
				else
					self:Load( bAllowJackets and sJacketPath or sBannerPath );
				end;
				self:scaletoclipped(160,160)
			end
		end;
	};
	
	LoadActor(THEME:GetPathG("_course", "overlay")) .. {
		InitCommand=cmd(zoom,0.55;);
	};
	
	SetCommand=function(self)
		hide_unwanted_music_wheel_text(self:GetParent())
	end

};

return t;