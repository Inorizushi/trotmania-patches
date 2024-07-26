local t = Def.ActorFrame{
	Def.Sprite{
		InitCommand=cmd(scaletoclipped,160,160);
			SetMessageCommand=function(self,params)
			if params.Type == "SectionCollapsed" then
				local group = params.Text;
				if group then
					if SONGMAN:GetSongGroupBannerPath(params.Text) ~= "" then
						self:Load(SONGMAN:GetSongGroupBannerPath(params.Text))
					else
						self:Load( THEME:GetPathG("Group jacket","fallback") );
					end
				else
					-- fallback
					self:Load( THEME:GetPathG("Group jacket","fallback") );
				end;
			end
		end;
	};
	
	LoadActor(THEME:GetPathG("group jacket", "group underlay")) .. {
		SetCommand=cmd(scaletoclipped,160,160;visible,GAMESTATE:GetSortOrder() == "SortOrder_Group";);
	};			
	
	LoadActor(THEME:GetPathG("group jacket", "genre")) .. {
		SetCommand=cmd(scaletoclipped,160,160;visible,GAMESTATE:GetSortOrder() == "SortOrder_Genre";);
	};			
	
	LoadActor(THEME:GetPathG("group jacket", "ABC")) .. {
		SetCommand=cmd(scaletoclipped,160,160;visible,GAMESTATE:GetSortOrder() == "SortOrder_Title";);
	};	
	
	LoadActor(THEME:GetPathG("group jacket", "BPM")) .. {
		SetCommand=cmd(scaletoclipped,160,160;visible,GAMESTATE:GetSortOrder() == "SortOrder_BPM";);
	};	
	
	LoadActor(THEME:GetPathG("group jacket", "ABC")) .. {
		SetCommand=cmd(scaletoclipped,160,160;visible,GAMESTATE:GetSortOrder() == "SortOrder_Artist";);
	};		
	
	LoadActor(THEME:GetPathG("Folder", "overlay")) .. {
		InitCommand=cmd(scaletoclipped,160,160;);
	};
	
	LoadFont("_unciadis Bold 48px")..{
		InitCommand=cmd(y,0;maxwidth,100);
		SetMessageCommand=function(self, params)
			if params.Type == "SectionCollapsed" then
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
	
	LoadFont("Common normal")..{
		InitCommand=cmd(y,0;maxwidth,160;rotationz,45;uppercase,true;);
		SetMessageCommand=function(self, params)
			if params.Type == "SectionCollapsed" then
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
	
	LoadFont("Common normal")..{
		InitCommand=cmd(y,0;maxwidth,160;rotationz,45;uppercase,true;);
		SetMessageCommand=function(self, params)
			if params.Type == "SectionCollapsed" then
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
	
	LoadFont("_unciadis Bold 48px")..{
		InitCommand=cmd(y,0;maxwidth,100);
		SetMessageCommand=function(self, params)
			if params.Type == "SectionCollapsed" then
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
			if params.Type == "SectionCollapsed" then
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
	
	SetCommand=function(self)
		self:GetParent():GetChild("SectionExpanded"):visible(false)
		self:GetParent():GetChild("SectionCollapsed"):visible(false)
	end;
};

return t;
