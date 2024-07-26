return Def.ActorFrame {
	--[[SetMessageCommand=function(s,p)
		if p.Index then
			if p.HasFocus then
				SCREENMAN:SystemMessage(p.Label)
			end
		end
	end,]]
	Def.Sprite{
		Texture=THEME:GetPathG("mode jacket","bg"),
		InitCommand=function(s) s:scaletoclipped(160,160) end,
	},
	LoadFont("Common Normal") .. {
		InitCommand=cmd(y,0;maxwidth,160;rotationz,45;uppercase,true;strokecolor,color("#000000"););
		SetMessageCommand=function(self, params)
			if params.Type == "Mode" then
				local mode = params.Label;
				local so = GAMESTATE:GetSortOrder();
				if so == "SortOrder_ModeMenu" then
					self:settext(mode);
					self:diffuse(color("#FFFFFF"));
				else
					self:settext("");
				end;
			end
		end;
	};	


	LoadActor(THEME:GetPathG("_song", "overlay")) .. {
		InitCommand=cmd(zoom,0.55;);
	};
	
	LoadActor(THEME:GetPathG("Highlight", "Oni")) .. {
		SetCommand=cmd(scaletoclipped,160,160;visible,mode == "Challenge";);
	};		
	
	LoadActor(THEME:GetPathG("Highlight", "Nonstop")) .. {
		SetCommand=cmd(scaletoclipped,160,160;visible,mode == "Playlists";);
	};	

	LoadActor(THEME:GetPathG("Highlight", "Endless")) .. {
		SetCommand=cmd(scaletoclipped,160,160;visible,mode == "Endless";);
	};

	LoadActor(THEME:GetPathG("Banner", "AllCourses")) .. {
		SetCommand=cmd(scaletoclipped,160,160;visible,mode == "All Courses";);
	};	
	
	LoadActor(THEME:GetPathG("Banner", "Survival")) .. {
		SetCommand=cmd(scaletoclipped,160,160;visible,mode == "Survival";);
	};
};
