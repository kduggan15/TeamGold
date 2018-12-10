drop table if exists users;
drop table if exists usersProfiles;
drop table if exists gameUsers;
drop table if exists games;
drop table if exists friends;
drop table if exists team;
drop table if exists teamUser;

drop PROCEDURE if exists addClanMember;
drop PROCEDURE if exists addingFriends;
drop PROCEDURE if exists removingFriends;

drop trigger if exists AddingOnesSelf;
drop trigger if exists score_checker;

create table users(userName varchar(127) primary key, name varchar(127), email varchar(127), birthday Date);
create table usersProfiles (userName varchar(127) primary key, profilePictures varchar(127), bio text);
create table gameUsers(userName varchar(127), gameID int, score int, totalHours int);
create table games(gameID int primary key, gameName varchar(255), gameDesc text, gameImage varchar(255), gameVideo varchar(255));
create table friends(userName varchar(127), userFriend varchar(255));
CREATE TABLE team (clanName VARCHAR(127) primary key, clanDesc text);
create table teamUser(clanName varchar(127), userName varchar(127), clanRank varchar(127));

insert into team values ('Red', 'We are Red we hate Blue');
insert into team values ('Blue', 'We are Blue we hate Red');
insert into team values ('Black', 'Black is an attitude as well as a life style');
insert into team values ('White', 'We are super White');
insert into team values ('Yellow', 'We are Yellow we just want to get along');

insert into teamUser values ('Red','iTzjT','Leader');
insert into teamUser values ('Blue','ThePeePeeMan','Leader');
insert into teamUser values ('Black','DudeBro','Leader');
insert into teamUser values ('White','AntMan','Leader');
insert into teamUser values ('Yellow','TheLord','Leader');

insert into teamUser values ('Red','PacMan','Member');
insert into teamUser values ('Blue','BigBoy','Member');
insert into teamUser values ('Black','SniperKiller','Member');
insert into teamUser values ('White','TimeLord','Member');
insert into teamUser values ('Yellow','HatMan','Member');
insert into teamUser values ('Red','HitMan','Member');

insert into users values ('iTzjT','Jonathan','jon@hotmail.com','1976-03-12');
insert into users values ('ThePeePeeMan','Peter','peter@hotmail.com','1974-09-23');
insert into users values ('AntMan','Anthony','anthony@hotmail.com','1969-10-28');
insert into users values ('TheLord','Mike','mike@hotmail.com','1987-12-23');
insert into users values ('BigBoy','Jon','JT@hotmail.com','2000-05-15');

insert into users values ('DudeBro','Bon','BON90@hotmail.com','1955-04-13');
insert into users values ('SniperKiller','Matt','Matt@hotmail.com','1969-02-20');
insert into users values ('TimeLord','David','David@hotmail.com','1990-12-23');
insert into users values ('HatMan','Jae','Jae@hotmail.com','2000-05-15');
insert into users values ('HitMan','Johnson','johnson@hotmail.com','1982-11-12');
insert into users values ('PacMan','Packer','Pack@hotmail.com','2000-05-15');

insert into usersProfiles values ('iTzjT','https://i.imgur.com/4k8uYpc.jpg','Master Chief Petty Officer John-117, more commonly known as the Master Chief, is a SPARTAN-II commando of the UNSC Naval Special Warfare Command. He is the protagonist and main character in both the Halo trilogy and Reclaimer Saga. With over thirty years of active duty, he has become one of the most decorated war veterans in the United Nations Space Command, earning every known UNSC medal except the Prisoner of War Medallion.');
insert into usersProfiles values ('ThePeePeeMan','https://i.imgur.com/nPJeVQm.jpg','Hello, my name is Peter and I am the peepee man. I drink the pee of my victims LOLZ');
insert into usersProfiles values ('AntMan','https://i.imgur.com/nwhnRsZ.jpg','My name is Anthony and I have the powers of an Ant. Its pretty cool. I can lift objects 10 times my own body weight.');
insert into usersProfiles values ('TheLord', 'https://i.imgur.com/0ZWPBE6.jpg', 'I am the lord. Come to me my child and I will grant you one wish. And only one, no I wish for a million wishes.');
insert into usersProfiles values ('BigBoy','https://i.imgur.com/Fb89mL3.png','Sup my name is BigBoy and Im a big boy. I workout and lift. I eat and I consume. I big and Im huge. Dont mess with me.');

insert into usersProfiles values ('DudeBro','https://i.imgur.com/wSO1BDW.jpg','Master Chief Petty Officer John-117, more commonly known as the Master Chief, is a SPARTAN-II commando of the UNSC Naval Special Warfare Command. He is the protagonist and main character in both the Halo trilogy and Reclaimer Saga. With over thirty years of active duty, he has become one of the most decorated war veterans in the United Nations Space Command, earning every known UNSC medal except the Prisoner of War Medallion.');
insert into usersProfiles values ('SniperKiller','https://i.imgur.com/a6kseh7.jpg','I am the sniper killer. I joined the army 50 years ago as a little boy. My father was Gun killer. He named me after his gun, which was a sniper.');
insert into usersProfiles values ('TimeLord','https://i.imgur.com/naFKKLa.jpg','I am a time lord. I travel in a space time machine called the tardis. I am on a mission to stop the doctor from destorying the universe.');
insert into usersProfiles values ('HatMan', 'https://i.imgur.com/5GJokS2.jpg', 'I am the Hat Man I sell Hats and I also eat Hats. I enjoy many hobbies like Hats. I hate batman, he took my name. The HatMan.');
insert into usersProfiles values ('HitMan','https://i.imgur.com/LKBm7qZ.jpg','I am the HitMan. I like to hit people. I mean look at my name.');
insert into usersProfiles values ('PacMan','https://i.imgur.com/9g7jyuC.png','Sup I am the PacMan thats right THE PACMAN! I eat ghosts and kill things with my mouth.');


insert into friends values('iTzjT','ThePeePeeMan');
insert into friends values('iTzjT','AntMan');
insert into friends values('iTzjT','TheLord');
insert into friends values('iTzjT','BigBoy');

insert into friends values('ThePeePeeMan','PacMan');
insert into friends values('ThePeePeeMan','AntMan');
insert into friends values('ThePeePeeMan','TheLord');
insert into friends values('ThePeePeeMan','DudeBro');
insert into friends values('ThePeePeeMan','SniperKiller');
insert into friends values('ThePeePeeMan','TimeLord');
insert into friends values('ThePeePeeMan','HatMan');
insert into friends values('ThePeePeeMan','PacMan');

insert into friends values('AntMan','PacMan');
insert into friends values('AntMan','TheLord');
insert into friends values('AntMan','BigBoy');
insert into friends values('AntMan','PacMan');
insert into friends values('AntMan','DudeBro');
insert into friends values('AntMan','SniperKiller');
insert into friends values('AntMan','HitMan');

insert into friends values('TheLord','PacMan');
insert into friends values('TheLord','AntMan');
insert into friends values('TheLord','TheLord');
insert into friends values('TheLord','BigBoy');
insert into friends values('TheLord','PacMan');
insert into friends values('TheLord','DudeBro');
insert into friends values('TheLord','SniperKiller');
insert into friends values('TheLord','HitMan');

insert into friends values('SniperKiller','PacMan');
insert into friends values('SniperKiller','AntMan');
insert into friends values('SniperKiller','TheLord');
insert into friends values('SniperKiller','BigBoy');
insert into friends values('SniperKiller','PacMan');
insert into friends values('SniperKiller','DudeBro');
insert into friends values('SniperKiller','HitMan');

insert into friends values('TimeLord','AntMan');
insert into friends values('TimeLord','SniperKiller');
insert into friends values('TimeLord','TimeLord');
insert into friends values('TimeLord','HatMan');

insert into friends values('HatMan','AntMan');
insert into friends values('HatMan','TheLord');
insert into friends values('HatMan','BigBoy');
insert into friends values('HatMan','PacMan');
insert into friends values('HatMan','HitMan');

insert into friends values('HitMan','AntMan');
insert into friends values('HitMan','TheLord');
insert into friends values('HitMan','BigBoy');
insert into friends values('HitMan','PacMan');

insert into friends values('PacMan','AntMan');
insert into friends values('PacMan','TheLord');
insert into friends values('PacMan','DudeBro');
insert into friends values('PacMan','SniperKiller');
insert into friends values('PacMan','TimeLord');
insert into friends values('PacMan','HatMan');
insert into friends values('PacMan','PacMan');


insert into games values(1111, 'Rainbow Six Seige',
'Tom Clancy’s Rainbow Six Siege is a tactical shooter video game developed by Ubisoft Montreal and published by Ubisoft. It was released worldwide for Microsoft Windows, PlayStation 4, and Xbox One on December 1, 2015. The game puts heavy emphasis on environmental destruction and cooperation between players. Each player assumes control of an attacker or a defender in different gameplay modes such as rescuing a hostage and defusing a bomb. The title has no campaign but features a series of short missions that can be played solo. These missions have a loose narrative, focusing on recruits going through training to prepare them for future encounters with the White Masks, a terrorist group that threatens the safety of the world.'
,'https://gearnuke.b-cdn.net/wp-content/uploads/2016/01/rainbow-six-siege.jpg','https://www.youtube.com/embed/6wlvYh0h63k');
insert into games values(2222, 'Fortnite Battle Royale',
'As a battle royale game, Fortnite Battle Royale features up to 100 players, alone, in duos, or in squads of up to four players, attempting to be the last player or group alive by killing other players or evading them, while staying within a constantly shrinking safe zone to prevent taking lethal damage from being outside it. Players start with no intrinsic advantages, and must scavenge for weapons and armor to gain the upper hand on their opponents. The game adds the construction element from Fortnite; players can break down most objects in the game world to gain resources they can use to build fortifications as part of their strategy. Limited-time modes are cycled through the game that introduce experimental or unconventional gameplay but otherwise follow the battle royale "last player standing" goal. The game features cross-platform play between the platforms that was limited for the first five seasons, before the restrictions were eased.'
,'https://static-assets-prod.epicgames.com/fortnite/static/webpack/8704d4d5ffd1c315ac8e2c805a585764.jpg','https://www.youtube.com/embed/2gUtfBmw86Y');
insert into games values(3333, 'Black Ops 4',
 'Black Ops 4 is the first Call of Duty title without a traditional single-player campaign mode. Instead, it features the Solo Missions mode, which focuses on the backstories of the games multiplayer characters, known as "Specialists". The missions take place between Black Ops II and III chronologically. Some of the Specialists also carried over from Black Ops III. The multiplayer mode is the first in the series to not feature automatic health regeneration and introduces both predictive recoil and a new ballistics system. The game includes three Zombies maps on release day, four if a special edition of the game, or the Black Ops Pass, is purchased. The locations of the maps include the RMS Titanic, an arena in Ancient Rome, and Alcatraz Federal Penitentiary. The game also introduces a battle royale mode called Blackout, which features up to 100 players in each match. Many characters from this and other Black Ops titles can be used as the players character model in this mode.'
,'https://i.redd.it/hf77kkmbmmy01.jpg','https://www.youtube.com/embed/6kqe2ICmTxc');
insert into games values(4444, 'League of Legends',
'In League of Legends, players assume the role of an unseen "summoner" that controls a "champion" with unique abilities and battle against a team of other players or computer-controlled champions. The goal is usually to destroy the opposing teams "nexus", a structure that lies at the heart of a base protected by defensive structures, although other distinct game modes exist as well. Each League of Legends match is discrete, with all champions starting off fairly weak but increasing in strength by accumulating items and experience over the course of the game. The champions and setting blend a variety of elements, including high fantasy, steampunk, and Lovecraftian horror.'
,'https://www.foxsportsasia.com/uploads/2018/05/LoL-Banner.jpg','https://www.youtube.com/embed/BGtROJeMPeE');
insert into games values(5555, 'Assassins Creed Odyessey',
'Assassins Creed Odyssey is an action role-playing video game developed by Ubisoft Quebec and published by Ubisoft. It is the eleventh major installment, and twentieth overall, in the Assassins Creed series and the successor to 2017s Assassins Creed Origins. Set in the year 431 BCE, the plot tells a fictional history of the Peloponnesian War between Athens and Sparta. Players control a male or female mercenary who fights for both sides as they attempt to unite their family and uncover a malign cult.',
'https://hb.imgix.net/74e8d7c2ec7dde490abf64d54f9828fa073ae4e3.jpg?auto=compress,format&fit=crop&h=353&w=616&s=6b9af392df9564413a51c35a14a3c6d1','https://www.youtube.com/embed/s_SJZSAtLBA');

insert into games values(6666, 'Overwatch',
'Overwatch is a team-based multiplayer first-person shooter video game developed and published by Blizzard Entertainment, which released on May 24, 2016 for PlayStation 4, Xbox One, and Windows. Described as a "hero shooter", Overwatch assigns players into two teams of six, with each player selecting from a roster of over 20 characters, known as "heroes", each with a unique style of play whose roles are divided into three general categories that fit their role. Players on a team work together to secure and defend control points on a map or escort a payload across the map in a limited amount of time. Players gain cosmetic rewards that do not affect gameplay, such as character skins and victory poses, as they play the game. The game was initially launched with casual play, with a competitive ranked mode, various arcade game modes, and a player-customizable server browser subsequently included following its release. Additionally, Blizzard has developed and added new characters, maps, and game modes post-release, while stating that all Overwatch updates will remain free, with the only additional cost to players being microtransactions to earn additional cosmetic rewards.',
'https://d3hmvhl7ru3t12.cloudfront.net/img/logos/overwatch-share-3d5a268515283007bdf3452e877adac466d579f4b44abbd05aa0a98aba582eeaebc4541f1154e57ec5a43693345bebda953381a7b75b58adbd29d3f3eb439ad2.jpg','https://www.youtube.com/embed/FqnKB22pOC0');

insert into games values(7777, 'Red Dead Redemption 2',
'Red Dead Redemption 2[a] is a Western-themed action-adventure video game developed and published by Rockstar Games. The game is a prequel to the 2010 game Red Dead Redemption, and the third entry in the Red Dead series. Set in 1899, it follows the story of outlaw Arthur Morgan, a member of the Van der Linde gang.',
'https://i.ytimg.com/vi/9KiSwbFmu0E/maxresdefault.jpg','https://www.youtube.com/embed/Dw_oH5oiUSE');

insert into games values(8888, 'Counter-Strike: Global Offensive',
'Counter-Strike: Global Offensive (CS:GO) is a multiplayer first-person shooter video game developed by Hidden Path Entertainment and Valve Corporation. It is the fourth game in the Counter-Strike series and was released for Microsoft Windows, OS X, Xbox 360, and PlayStation 3 in August 2012, with the Linux version released in September 2014. The game pits two teams against each other: the Terrorists and the Counter-Terrorists. Both sides are tasked with eliminating the other while also completing separate objectives, the Terrorists, depending on the game mode, must either plant the bomb or defend the hostages, while the Counter-Terrorists must either prevent the bomb from being planted, defuse the bomb, or rescue the hostages. There are eight game modes, all of which have distinct characteristics specific to that mode.',
'https://www.hdwallpaper.nu/wp-content/uploads/2015/10/maxresdefault44.jpg','https://www.youtube.com/embed/edYCtaNueQY');

insert into games values(9999, 'Minecraft',
'Minecraft is a 2011 sandbox video game created by Swedish game developer Markus Persson and later developed by Mojang. The game allows players to build with a variety of different blocks in a 3D procedurally generated world, requiring creativity from players. Other activities in the game include exploration, resource gathering, crafting, and combat.',
'https://compass-ssl.xbox.com/assets/0f/e2/0fe20042-0bb8-4781-82f4-7130f928b021.jpg?n=Minecraft-2017_Superhero-0_Keyart_767x431.jpg','https://www.youtube.com/embed/MmB9b5njVbA');

insert into games values(11111, 'Dota 2',
'Dota 2 is a multiplayer online battle arena (MOBA) video game developed and published by Valve Corporation. The game is a sequel to Defense of the Ancients (DotA), which was a community-created mod for Blizzard Entertainments Warcraft III: Reign of Chaos and its expansion pack, The Frozen Throne. Dota 2 is played in matches between two teams of five players, with each team occupying and defending their own separate base on the map. Each of the ten players independently controls a powerful character, known as a "hero", who all have unique abilities and differing styles of play. During a match, players collect experience points and items for their heroes to successfully defeat the opposing teams heroes in player versus player combat. A team wins by being the first to destroy a large structure located in the opposing teams base, called the "Ancient".',
'https://cdn-images-1.medium.com/max/1191/0*vbw4wQW_Xq2_3eOo.jpg','https://www.youtube.com/embed/-cSFPIwMEq4');

insert into games values(12222, 'World of Warcraft',
'World of Warcraft (WoW) is a massively multiplayer online role-playing game (MMORPG) released in 2004 by Blizzard Entertainment. It is the fourth released game set in the Warcraft fantasy universe.[3] World of Warcraft takes place within the Warcraft world of Azeroth, approximately four years after the events at the conclusion of Blizzards previous Warcraft release, Warcraft III: The Frozen Throne.[4] The game was announced in 2001, and was released for the 10th anniversary of the Warcraft franchise on November 23, 2004. Since launch, World of Warcraft has had seven major expansion packs released for it: The Burning Crusade, Wrath of the Lich King, Cataclysm, Mists of Pandaria, Warlords of Draenor, Legion, and Battle for Azeroth.',
'http://vamers.com/wp-content/uploads/2018/07/Vamers-Gaming-World-of-Warcraft-subscription-now-gives-access-to-all-previous-expansions-1.jpg','https://www.youtube.com/embed/jSJr3dXZfcg');

insert into games values(13333, 'Super Mario Odyssey',
'Super Mario Odyssey is a platform game published by Nintendo for the Nintendo Switch on October 27, 2017. An entry in the Super Mario series, it follows Mario and Cappy, a spirit that turns into Marios hat and allows him to possess other characters and objects, as they journey across various worlds to save Princess Peach from his nemesis Bowser, who plans to forcibly marry her. In contrast to the linear gameplay of prior entries, the game returns to the primarily open-ended, exploration-based gameplay featured in Super Mario 64 and Super Mario Sunshine.',
'https://i.redd.it/ky70exc7bbmz.png','https://www.youtube.com/embed/wGQHQc_3ycE');

insert into games values(14444, 'Grand Theft Auto V',
'Grand Theft Auto V is an action-adventure video game developed by Rockstar North and published by Rockstar Games. It was released in September 2013 for PlayStation 3 and Xbox 360, in November 2014 for PlayStation 4 and Xbox One, and in April 2015 for Microsoft Windows. It is the first main entry in the Grand Theft Auto series since 2008s Grand Theft Auto IV. Set within the fictional state of San Andreas, based on Southern California, the single-player story follows three criminals and their efforts to commit heists while under pressure from a government agency. The open world design lets players freely roam San Andreas open countryside and the fictional city of Los Santos, based on Los Angeles.',
'http://www.guinnessworldrecords.com/Images/GTA-V-main_tcm25-19095.jpg','https://www.youtube.com/embed/QkkoHAzjnUs');

insert into games values(15555, 'Hearthstone',
'Hearthstone, originally Hearthstone: Heroes of Warcraft, is a free-to-play online collectible card video game developed and published by Blizzard Entertainment. Having been released worldwide on March 11, 2014, Hearthstone builds upon the existing lore of the Warcraft series by using the same elements, characters, and relics. It was first released for Microsoft Windows and macOS, with support for iOS and Android devices being added later. The game features cross-platform play, allowing players on any supported device to compete with each other, restricted only by geographical region account limits.',
'https://glasscannon.ru/wp-content/uploads/2016/11/hearthstone-new-logo-2016-thumb.jpg','https://www.youtube.com/embed/vPguoeYTvMI');

insert into games values(16666, 'The Legend of Zelda: Breath of the Wild',
'The Legend of Zelda: Breath of the Wild is an action-adventure game developed and published by Nintendo. An entry in the longrunning The Legend of Zelda series, it was released for the Nintendo Switch and Wii U consoles on March 3, 2017. Breath of the Wild takes place at the end of the Zelda timeline; the player controls Link, who awakens from a hundred-year slumber to defeat Calamity Ganon before it can destroy the kingdom of Hyrule.',
'https://2.bp.blogspot.com/-mpyp6XTwu54/V2Okz_WXyVI/AAAAAAAAAPA/n1WRDqK_X6YLS-lnoTsvxXHvHNazP1v9QCLcB/s1600/the-legend-of-zelda-breath-of-the-wind-things-to-do.jpg','https://www.youtube.com/embed/zw47_q9wbBE');

insert into games values(17777, 'Rocket League',
'Rocket League is a vehicular soccer video game developed and published by Psyonix. The game was first released for Microsoft Windows and PlayStation 4 in July 2015, with ports for Xbox One, macOS, Linux, and Nintendo Switch being released later on. In June 2016, 505 Games began distributing a physical retail version for PlayStation 4 and Xbox One, with Warner Bros. Interactive Entertainment taking over those duties by the end of 2017.',
'https://www.nintendoenthusiast.com/wp-content/uploads/2017/11/rocket-league-feature.png','https://www.youtube.com/embed/NC82dWrFqCE');

insert into games values(18888, 'The Elder Scrolls V: Skyrim',
'The Elder Scrolls V: Skyrim is an action role-playing video game developed by Bethesda Game Studios and published by Bethesda Softworks. It is the fifth main installment in The Elder Scrolls series, following The Elder Scrolls IV: Oblivion, and was originally released worldwide for Microsoft Windows, PlayStation 3, and Xbox 360 on November 11, 2011.',
'https://res.cloudinary.com/teepublic/image/private/s--_Gj7g45c--/t_Preview/b_rgb:191919,c_lpad,f_jpg,h_630,q_90,w_1200/v1532891870/production/designs/2953029_0.jpg','https://www.youtube.com/embed/JSRtYpNRoN0');


insert into gameUsers values ('iTzjT',1111, 1615, 342);
insert into gameUsers values ('iTzjT',2222, 574, 34);
insert into gameUsers values ('iTzjT',3333, 2000, 100);
insert into gameUsers values ('iTzjT',4444, 9362, 78);
insert into gameUsers values ('iTzjT',5555, 1615, 342);
insert into gameUsers values ('iTzjT',6666, 574, 34);
insert into gameUsers values ('iTzjT',7777, 2000, 100);
insert into gameUsers values ('iTzjT',8888, 9362, 78);
insert into gameUsers values ('iTzjT',11111, 9362, 78);
insert into gameUsers values ('iTzjT',12222, 1615, 342);
insert into gameUsers values ('iTzjT',13333, 574, 34);
insert into gameUsers values ('iTzjT',14444, 2000, 100);
insert into gameUsers values ('iTzjT',15555, 9362, 78);

insert into gameUsers values ('ThePeePeeMan',2222, 555, 6);

insert into gameUsers values ('AntMan',1111, 155, 23);
insert into gameUsers values ('AntMan',3333, 1900, 50);
insert into gameUsers values ('AntMan',17777, 366, 212);


insert into gameUsers values ('TheLord',16666, 12312, 5);
insert into gameUsers values ('TheLord',17777, 455, 250);
insert into gameUsers values ('TheLord',18888, 5000, 234);
insert into gameUsers values ('BigBoy',1111, 8945, 1000);

insert into gameUsers values ('BigBoy',6666, 555, 123);
insert into gameUsers values ('BigBoy',7777, 412, 5);


insert into gameUsers values ('DudeBro',1111, 7234, 73);
insert into gameUsers values ('DudeBro',2222, 555, 678);
insert into gameUsers values ('DudeBro',4444, 1415, 2334);
insert into gameUsers values ('DudeBro',6666, 7234, 73);
insert into gameUsers values ('DudeBro',11111, 7234, 73);
insert into gameUsers values ('DudeBro',12222, 555, 678);
insert into gameUsers values ('DudeBro',16666, 7234, 73);

insert into gameUsers values ('SniperKiller',1111, 7635, 543);
insert into gameUsers values ('SniperKiller',3333, 2456, 123);
insert into gameUsers values ('SniperKiller',4444, 78999, 2000);
insert into gameUsers values ('SniperKiller',8888, 7635, 543);
insert into gameUsers values ('SniperKiller',9999, 2456, 123);
insert into gameUsers values ('SniperKiller',6666, 78999, 2000);
insert into gameUsers values ('SniperKiller',13333, 2456, 123);
insert into gameUsers values ('SniperKiller',14444, 78999, 2000);
insert into gameUsers values ('SniperKiller',18888, 7635, 543);


insert into gameUsers values ('TimeLord',5555, 745, 234);
insert into gameUsers values ('TimeLord',6666, 555, 345);
insert into gameUsers values ('TimeLord',9999, 712, 4);
insert into gameUsers values ('TimeLord',13333, 712, 4);
insert into gameUsers values ('TimeLord',16666, 555, 345);

insert into gameUsers values ('HatMan',1111, 14134, 5223);
insert into gameUsers values ('HatMan',18888, 5666, 1233);

insert into gameUsers values ('HitMan',1111, 1000, 1000);
insert into gameUsers values ('HitMan',2222, 555, 4235);
insert into gameUsers values ('HitMan',3333, 2431, 800);
insert into gameUsers values ('HitMan',4444, 8089, 123);
insert into gameUsers values ('HitMan',8888, 8089, 123);
insert into gameUsers values ('HitMan',11111, 1000, 1000);
insert into gameUsers values ('HitMan',12222, 555, 4235);
insert into gameUsers values ('HitMan',13333, 2431, 800);

insert into gameUsers values ('PacMan',4444, 345, 23);
insert into gameUsers values ('PacMan',5555, 400, 3);
insert into gameUsers values ('PacMan',8888, 555, 243);
insert into gameUsers values ('PacMan',12222, 555, 243);
insert into gameUsers values ('PacMan',15555, 400, 3);
insert into gameUsers values ('PacMan',18888, 555, 243);


delimiter //
CREATE PROCEDURE addClanMember( IN Clan VARCHAR(127), userName VARCHAR(127), clanRank VARCHAR(127))
BEGIN
	INSERT INTO teamUser VALUES(Clan, userName, clanRank);
END //
-- CALL addClanMember('test', 'test', 'test');

delimiter //
CREATE TRIGGER score_check BEFORE UPDATE on gameUsers
FOR EACH ROW
BEGIN
  IF NEW.score<gameUsers.score THEN
  UPDATE gameUsers SET NEW.score = gameUsers.score;
  END IF;
  IF NEW.totalHours < gameUsers.totalHours THEN
  UPDATE gameUsers SET NEW.totalHours = gameUsers.totalHours;
  END IF;
END //

CREATE PROCEDURE addingFriends(userName VARCHAR(127), userFriend VARCHAR(127))
BEGIN
	INSERT INTO friends VALUES(userName, userFriend);
END //

CREATE PROCEDURE removingFriends(userName VARCHAR(127), userFriend VARCHAR(127))
BEGIN
	DELETE from friends WHERE friends.userName = userName AND friends.userFriend = userFriend;
END //

CREATE TRIGGER AddingOnesSelf
AFTER INSERT ON friends FOR EACH ROW
BEGIN
	if(New.userFriend = New.userName) THEN
	DELETE FROM friends Where userName = New.userName AND userFriend = New.userFriend;
	END IF;
END//  

  
