
CREATE TABLE [BUILDINGS] (
  [park] varchar(20) DEFAULT NULL,
  [building_name] varchar(32) DEFAULT NULL,
  [building_code] varchar(10) NOT NULL,
  PRIMARY KEY ([building_code])
) 

INSERT INTO [BUILDINGS] ([park], [building_name], [building_code]) VALUES
('Central', 'Schofield', 'A'),
('Central', 'James France', 'CC'),
('Central', 'James France', 'D'),
('Central', 'G Block', 'G'),
('Central', 'Wavy Top', 'GG'),
('Central', 'Edward Herbert', 'J'),
('Central', 'Hazelgrave', 'N'),
('Central', 'Stewart Mason Building', 'SMB'),
('Central', 'Brockington', 'B'),
('Central', 'Brockington', 'U'),
('East', 'Health, Exercise and biosciences', 'HE'),
('East', 'Sir John Beckweth', 'JB'),
('East', 'Ann Packer', 'JJ'),
('East', 'Loughborough Design School ', 'LDS'),
('East', 'LUSAD', 'LUSAD'),
('East', 'John Cooper', 'YY'),
('East', 'Matthew Arnold', 'ZZ'),
('West', 'John Pickford', 'HH'),
('West', 'Keith Gree Building', 'KG'),
('West', 'Sir Frank Gibb', 'RT'),
('West', 'IPTME', 'S'),
('West', 'Wolfson School', 'T'),
('West', 'Sir David Davies', 'W');
