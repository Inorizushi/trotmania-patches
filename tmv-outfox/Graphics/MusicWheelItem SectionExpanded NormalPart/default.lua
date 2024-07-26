return Def.ActorFrame {
	SetCommand=function(self)
		self:GetParent():GetChild("SectionCount"):visible(false)
	end;
	Def.Sprite {
		SetCommand=function(self,params)
			if params.Type == "SectionExpanded" then
			if not GAMESTATE:IsCourseMode() then
				self:Load( THEME:GetPathG("","MusicWheelItem SectionExpanded NormalPart/_base") );
			else
				self:Load( THEME:GetPathG("","MusicWheelItem SectionExpanded NormalPart/_course") );
			end;
		end
		end;
	};
	
	Def.Sprite {
		SetCommand=function(self,params)
			if params.Type == "SectionExpanded" then
			if not GAMESTATE:IsCourseMode() then
				local group = params.Text;
				local jacketsets = {
					["TrotMania VI"] = "tm6",
					["TrotMania V"] = "tm5",
					["TrotMania IV"] = "tm4",
					["TrotMania III"] = "tm3",
					["TrotMania Chrystalize"] = "tm2",
					["TrotMania"] = "tm1",
					["Trials of the Embers"] = "tmtrials",
					["TM Mod Lab"] = "modlab",
					["UKSRT8"] = "uksrt8",
					["UKSRT9"] = "uksrt9"
				}

				if jacketsets[group] then
					self:Load( THEME:GetPathG("SectionCollapsed",jacketsets[group]) )
				else
					self:Load( THEME:GetPathG("","_blank") )
				end
			else
				self:Load( THEME:GetPathG("","_blank") )
			end
		end
		end
	};
	-- Thumbnail
	LoadActor(THEME:GetPathG("MusicWheelItem", "SectionThumb")) .. {
		InitCommand=function(self) self:x(-169):visible(not GAMESTATE:IsCourseMode()) end;
	};
};