local sBannerPath = THEME:GetPathG("Common", "fallback banner");
local sJacketPath = THEME:GetPathG("Common", "fallback jacket");
local bAllowJackets = true

local t = Def.ActorFrame {};

t[#t+1] = Def.Sprite {
		Name="Banner";
		-- Set em up the graphics.
		SetMessageCommand=function(self,params)
			if params.Type == "Song" then
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
				self:scaletoclipped(164,164)
			end
		end;
	};
	
-- Cute overlay
if isDayTime() == 'true' then
	t[#t+1] = LoadActor(THEME:GetPathG("_song", "overlay")) .. {
		InitCommand=cmd(zoom,0.55;);
	};
	else
	t[#t+1] = LoadActor(THEME:GetPathG("_song", "night")) .. {
		InitCommand=cmd(zoom,0.55;);
	};
	end
	
return t;
