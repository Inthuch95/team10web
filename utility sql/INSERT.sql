INSERT INTO [REQUESTS] ([module], [room_code], [capacity], [wheelchair], [projector], [visualiser], [whiteboard], [computer], [lecture_capture], [pa_system], [radio_microphone], [video_dvd], [arrangement], [special_req], [priority], [day], [period], [duration], [status], [park], [semester], [year], [lecturer], [dept_code], [session]) VALUES (N'COA101', N'A.0.01', 45, 1, 1, 1, 1, 0, 0, 0, 0, 0, N'Tiered', N'test', 1, N'Monday', 1, 1, N'Booked', N'Central', 1, 2015, N'not ray dawson', N'CO', N'Lecture');SELECT SCOPE_IDENTITY() AS [id];
INSERT INTO [REQUESTS] ([module], [room_code], [capacity], [wheelchair], [projector], [visualiser], [whiteboard], [computer], [lecture_capture], [pa_system], [radio_microphone], [video_dvd], [arrangement], [special_req], [priority], [day], [period], [duration], [status], [park], [semester], [year], [lecturer], [dept_code], [session]) VALUES (N'COA123', N'J.0.01', 100, 0, 0, 0, 0, 0, 0, 0, 0, 0, N'Tiered', N'dfjdgbdf', 1, N'Tuesday', 2, 1, N'Rejected', N'Central', 2, 2015, N'not ray', N'CO', N'Lecture');SELECT SCOPE_IDENTITY();
INSERT INTO [REQUESTS] ([module], [room_code], [capacity], [wheelchair], [projector], [visualiser], [whiteboard], [computer], [lecture_capture], [pa_system], [radio_microphone], [video_dvd], [arrangement] , [special_req], [priority], [day], [period], [duration], [status], [park], [semester], [year], [lecturer], [dept_code], [session]) VALUES (N'COB107', N'CC.0.21', 80, 1, 1, 1, 1, 1, 0, 0, 0, 0, N'Tiered', N'Please get some pillow, it''s really boring', 1, N'Friday', 5, 2, N'Pending', N'Central', 1, 2015, N'boring lady', N'CO', N'Lecture');SELECT SCOPE_IDENTITY();
