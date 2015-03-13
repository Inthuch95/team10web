CREATE TABLE [ROOMS] (
  [building_code] varchar(5) DEFAULT NULL,
  [room_code] varchar(13) NOT NULL DEFAULT '',
  [capacity] int DEFAULT NULL,
  [wheelchair] int DEFAULT NULL,
  [projector] int DEFAULT NULL,
  [visualiser] int DEFAULT NULL,
  [whiteboard] int DEFAULT NULL,
  [computer] int DEFAULT NULL,
  [video_dvd] int DEFAULT NULL,
  [pa_system] int DEFAULT NULL,
  [radio_microphone] int DEFAULT NULL,
  [lecture_capture] int DEFAULT NULL,
  [tired] int DEFAULT NULL,
  [flat] int DEFAULT NULL,
  PRIMARY KEY ([room_code])
)