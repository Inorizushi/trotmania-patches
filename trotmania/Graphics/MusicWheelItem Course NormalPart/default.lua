local t = Def.ActorFrame {
	Def.Quad {
		InitCommand=cmd(zoomto,140,140;diffuse,Color("Green"));
		SetMessageCommand=function(self,params)
			if params.Type == "Course" then
				local song = params.Song;
				local course = params.Course;
				if song and not course then
					self:diffuse( SONGMAN:GetSongColor( song ) );
				elseif course and not song then
					self:diffuse( SONGMAN:GetCourseColor( song ) );
				end
			end
		end;
	};
	-- Reflection
	Def.Banner {
		InitCommand=cmd(y,70;vertalign,bottom;cropto,140,140;rotationz,-180;rotationy,-180;diffusealpha,0.5;croptop,0.5;fadetop,1);
		SetMessageCommand=function(self,params)
			if params.Type == "Course" then
				local song = params.Song;
				local course = params.Course;
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
		InitCommand=cmd(y,70;vertalign,bottom;cropto,140,140);
		SetMessageCommand=function(self,params)
			if params.Type == "Course" then
				local song = params.Song;
				local course = params.Course;
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
};
return t;
