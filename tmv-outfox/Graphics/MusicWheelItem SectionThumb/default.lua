return Def.ActorFrame {
	Def.Quad {
		InitCommand=function(self) self:diffuse(color("#000000")):zoomto(54,54):diffusealpha(0.6) end;
	},
	Def.Sprite{
		InitCommand=function(self) self:scaletoclipped(52,52) end;
		SetMessageCommand=function(self,params)
			if params.Type == "SectionCollapsed" or params.Type == "SectionExpanded" then
				if params.Text then
					if SONGMAN:GetSongGroupBannerPath(params.Text) ~= "" then
						self:Load(SONGMAN:GetSongGroupBannerPath(params.Text))
					else
						self:Load( THEME:GetPathG("Jacket","base") );
					end
				else
				-- fallback
					self:Load( THEME:GetPathG("Jacket","base") );
				end;
			end
		end;
	},
	
	--- Mini jackets
	Def.Sprite {
		SetCommand=function(self,params)
			if params.Type == "SectionCollapsed" or params.Type == "SectionExpanded" then
			if not GAMESTATE:IsCourseMode() then
				local group = params.Text;
				local jacketsets = {
					["In the Groove"] = "itg1",
					["In the Groove 2"] = "itg2",
					["In the Groove 3 OG"] = "itg3",
					["TrotMania VI"] = "tm6",
					["TrotMania V"] = "tm5",
					["TrotMania IV"] = "tm4",
					["TrotMania III"] = "tm3",
					["TrotMania Chrystalize"] = "tm2",
					["TrotMania"] = "tm1",
					["Trials of the Embers"] = "tmtrials",
					["UKSRT8"] = "uksrt8",
					["UKSRT9"] = "uksrt9",
					["DanceDanceRevolution A"] = "ddra",
					["DanceDanceRevolution A20"] = "ddr20th",
					["DanceDanceRevolution A20 PLUS"] = "ddra20plus",					
					["DDR A"] = "ddra",
					["DDR A20"] = "ddr20th",
					["DDR A20 PLUS"] = "ddra20plus",
					["DDR XX"] = "ddrxx",
					["Outfox"] = "outfox"
				}

				if jacketsets[group] then
					self:Load( THEME:GetPathG("_minijacket",jacketsets[group]) )
				else
					self:Load( THEME:GetPathG("","_blank") )
				end
			else
				self:Load( THEME:GetPathG("","_blank") )
			end
		end
		end
	}
}