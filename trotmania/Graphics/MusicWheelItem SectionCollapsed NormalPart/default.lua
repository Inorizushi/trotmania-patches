local t = Def.ActorFrame{
	Def.Sprite{
		InitCommand=cmd(scaletoclipped,140,140);
		SetMessageCommand=function(self,params)
			if params.Type == "SectionCollapsed" then
				local group = params.Text;
				if group then
					if SONGMAN:GetSongGroupBannerPath(group) ~= "nil" then
						self:Load(SONGMAN:GetSongGroupBannerPath(group));
					else
						self:Load( THEME:GetPathG("Common fallback","group") );
					end
				else
					-- fallback
					self:Load( THEME:GetPathG("Common fallback","group") );
				end;
			end
		end;
	};
	
	LoadActor(THEME:GetPathG("Folder", "overlay")) .. {
		OnCommand=cmd(scaletoclipped,142,142);
	};
}

return t;
