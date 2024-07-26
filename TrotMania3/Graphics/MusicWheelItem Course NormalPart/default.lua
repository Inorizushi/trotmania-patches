local t = Def.ActorFrame {
	-- Reflection
	Def.Banner {
		InitCommand=cmd(y,79;vertalign,bottom;cropto,154,154;rotationz,-180;rotationy,-180;diffusealpha,0.5;croptop,0.5;fadetop,1);
		SetMessageCommand=function(self,params)
			local song = params.Song;
			local course = params.Course;
			if params.Type == "Course" then
				if song and not course then
					-- this is where we do all song-specific stuff
					self:LoadFromSong(params.Song);
				elseif course and not song then
					-- this is where we do all course-specific stuff
					self:LoadFromCourse(params.Course);
				end
			end
		end;
	};
	-- Real Banner
	Def.Banner {
		InitCommand=cmd(y,79;vertalign,bottom;cropto,154,154;);
		SetMessageCommand=function(self,params)
			local song = params.Song;
			local course = params.Course;
			if params.Type == "Course" then
				if song and not course then
					-- this is where we do all song-specific stuff
					self:LoadFromSong(params.Song);
				elseif course and not song then
					-- this is where we do all course-specific stuff
					self:LoadFromCourse(params.Course);
				end
			end
		end;
	};

	LoadActor(THEME:GetPathG("Folder", "active")) .. {
		OnCommand=cmd(scaletoclipped,160,160);
	};
	
	SetCommand=function(self)
		hide_unwanted_music_wheel_text(self:GetParent())
	end
};
return t;
