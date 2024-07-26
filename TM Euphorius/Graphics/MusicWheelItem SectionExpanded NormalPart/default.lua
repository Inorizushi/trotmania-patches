local so = GAMESTATE:GetSortOrder()

local t = Def.ActorFrame{
	Def.Banner{
		InitCommand=cmd(scaletoclipped,160,160);
		SetMessageCommand=function(self,params)
			if params.Type == "SectionExpanded" then
				local group = params.Text;
				if group then
					self:LoadFromSongGroup(group);
				else
					-- fallback
					self:Load( THEME:GetPathG("Group jacket","fallback") );
				end;
			end
		end;
	};
	
	LoadActor(THEME:GetPathG("group jacket", "group underlay")) .. {
		SetCommand=function(s,p)
			if p.Type == "SectionExpanded" then
				s:scaletoclipped(160,160):visible(so == "SortOrder_Group")
			end
		end,
	};			
	
	LoadActor(THEME:GetPathG("group jacket", "genre")) .. {
		SetCommand=function(s,p)
			if p.Type == "SectionExpanded" then
				s:scaletoclipped(160,160):visible(so == "SortOrder_Genre")
			end
		end,
	};			
	
	LoadActor(THEME:GetPathG("group jacket", "ABC")) .. {
		SetCommand=function(s,p)
			if p.Type == "SectionExpanded" then
				s:scaletoclipped(160,160):visible(so == "SortOrder_Title")
			end
		end,
	};	
	
	LoadActor(THEME:GetPathG("group jacket", "BPM")) .. {
		SetCommand=function(s,p)
			if p.Type == "SectionExpanded" then
				s:scaletoclipped(160,160):visible(so == "SortOrder_BPM")
			end
		end,
	};	
	
	LoadActor(THEME:GetPathG("group jacket", "ABC")) .. {
		SetCommand=function(s,p)
			if p.Type == "SectionExpanded" then
				s:scaletoclipped(160,160):visible(so == "SortOrder_Artist")
			end
		end,
	};
		
	LoadActor(THEME:GetPathG("Banner", "Oni")) .. {
		SetCommand=function(s,p)
			if p.Type == "SectionExpanded" then
				local group = p.Text
				s:scaletoclipped(160,160):visible(group == "Oni")
			end
		end,
	};		
	
	LoadActor(THEME:GetPathG("Banner", "Nonstop")) .. {
		SetCommand=function(s,p)
			if p.Type == "SectionExpanded" then
				local group = p.Text
				s:scaletoclipped(160,160):visible(group == "Nonstop")
			end
		end,
	};	

	LoadActor(THEME:GetPathG("Banner", "Endless")) .. {
		SetCommand=function(s,p)
			if p.Type == "SectionExpanded" then
				local group = p.Text
				s:scaletoclipped(160,160):visible(group == "Endless")
			end
		end,
	};		
	
	LoadActor(THEME:GetPathG("Banner", "AllCourses")) .. {
		SetCommand=function(s,p)
			if p.Type == "SectionExpanded" then
				local group = p.Text
				s:scaletoclipped(160,160):visible(group == "All Courses")
			end
		end,
	};	
	
	LoadActor(THEME:GetPathG("Folder", "overlay")) .. {
		InitCommand=cmd(zoom,0.55;);
	};
	
	LoadFont("_troika 60px")..{
		InitCommand=cmd(y,0;maxwidth,100);
		SetMessageCommand=function(self, params)
			if params.Type == "SectionExpanded" then
				local song = params.Song;
				local group = params.Text;
				local so = GAMESTATE:GetSortOrder();
				if so == "SortOrder_Title" then
					self:settext(group);
					self:diffuse(color("#FFFFFF"));
					if group == "Other" then
						self:settext("&?!");
					end;
				else
					self:settext("");
				end;
			end
		end;
	};
	
	LoadFont("_troika 24px")..{
		InitCommand=cmd(y,0;maxwidth,160;rotationz,45;uppercase,true;);
		SetMessageCommand=function(self, params)
			if params.Type == "SectionExpanded" then
				local song = params.Song;
				local group = params.Text;
				local so = GAMESTATE:GetSortOrder();
				if so == "SortOrder_Genre" then
					self:settext(group);
					self:diffuse(color("#FFFFFF"));
				else
					self:settext("");
				end;
			end
		end;
	};		
	
	LoadFont("_troika 24px")..{
		InitCommand=cmd(y,0;maxwidth,160;rotationz,45;uppercase,true;);
		SetMessageCommand=function(self, params)
			if params.Type == "SectionExpanded" then
				local song = params.Song;
				local group = params.Text;
				local so = GAMESTATE:GetSortOrder();
				if so == "SortOrder_BPM" then
					self:settext(group);
					self:diffuse(color("#FFFFFF"));
				else
					self:settext("");
				end;
			end
		end;
	};	
	
	LoadFont("_troika 60px")..{
		InitCommand=cmd(y,0;maxwidth,100);
		SetMessageCommand=function(self, params)
			if params.Type == "SectionExpanded" then
				local song = params.Song;
				local group = params.Text;
				local so = GAMESTATE:GetSortOrder();
				if so == "SortOrder_Artist" then
					self:settext(group);
					self:diffuse(color("#FFFFFF"));
					if group == "Other" then
						self:settext("&?!");
					end;
				else
					self:settext("");
				end;
			end
		end;
	};
	
	LoadFont("Common normal")..{
		InitCommand=cmd(y,65;zoom,0.75;maxwidth,190);
		SetMessageCommand=function(self, params)
			if params.Type == "SectionExpanded" then
				local song = params.Song;
				local group = params.Text;
				local so = GAMESTATE:GetSortOrder();
				if so == "SortOrder_Group" then
					self:settext(group);
					self:diffuse(color("#FFFFFF"));
				else
					self:settext("");
				end;
			end
		end;
	};	
	
};

return t;
