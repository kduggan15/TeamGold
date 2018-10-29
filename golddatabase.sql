drop table if exists users;
drop table if exists usersProfiles;
drop table if exists gameUsers;
drop table if exists games;
drop table if exists friends;
drop table if exists team;
drop table if exists teamUser;


create table users(userName varchar(127) primary key, name varchar(127), email varchar(127), birthday Date);
create table usersProfiles (userName varchar(127) primary key, profilePictures varchar(127), bio text);
create table gameUsers(userName varchar(127), gameID int, score int, totalHours int);
create table games(gameID int primary key, gameName varchar(255), gameDesc text, gameImage varchar(255), gameVideo varchar(255));
create table friends(userName varchar(127), userFriend varchar(255));
CREATE TABLE team (clanName VARCHAR(127) primary key, clanDesc text);
create table teamUser(clanName varchar(127), userName varchar(127), clanRank varchar(127));

insert into team values ('Red', 'We are red we hate blue');
insert into team values ('Blue', 'We are red we hate red');
insert into team values ('Yellow', 'We are Yellow we just want to get along');

insert into teamUser values ('Red','iTzjT','Leader');
insert into teamUser values ('Blue','ThePeePeeMan','Leader');
insert into teamUser values ('Yellow','DudeBro','Leader');

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
insert into usersProfiles values ('AntMan','https://i.imgur.com/nwhnRsZ.jpg','My name is Anthony and I have the powers of an Ant. Its pretty cool. I can lift objects 10 times my own body weight :).');
insert into usersProfiles values ('TheLord', 'https://i.imgur.com/0ZWPBE6.jpg', 'I am the lord. Come to me my child and I will grant you one wish. And only one, no I wish for a million wishes.');
insert into usersProfiles values ('BigBoy','https://i.imgur.com/Fb89mL3.png','Sup my name is BigBoy and Im a big boy. I workout and lift. I eat and I consume. I big and Im huge. Dont mess with me ;).');

insert into usersProfiles values ('DudeBro','https://i.imgur.com/wSO1BDW.jpg','Master Chief Petty Officer John-117, more commonly known as the Master Chief, is a SPARTAN-II commando of the UNSC Naval Special Warfare Command. He is the protagonist and main character in both the Halo trilogy and Reclaimer Saga. With over thirty years of active duty, he has become one of the most decorated war veterans in the United Nations Space Command, earning every known UNSC medal except the Prisoner of War Medallion.');
insert into usersProfiles values ('SniperKiller','https://i.imgur.com/a6kseh7.jpg','Hello, my name is Peter and I am the peepee man. I drink the pee of my victims LOLZ');
insert into usersProfiles values ('TimeLord','https://i.imgur.com/naFKKLa.jpg','My name is Anthony and I have the powers of an Ant. Its pretty cool. I can lift objects 10 times my own body weight :).');
insert into usersProfiles values ('HatMan', 'https://i.imgur.com/5GJokS2.jpg', 'I am the lord. Come to me my child and I will grant you one wish. And only one, no I wish for a million wishes you faggot.');
insert into usersProfiles values ('HitMan','https://i.imgur.com/LKBm7qZ.jpg','Sup my name is BigBoy and Im a big boy. I workout and lift. I eat and I consume. I big and Im huge. Dont mess with me ;).');
insert into usersProfiles values ('PacMan','https://i.imgur.com/9g7jyuC.png','Sup my name is BigBoy and Im a big boy. I workout and lift. I eat and I consume. I big and Im huge. Dont mess with me ;).');


insert into friends values('iTzjT','ThePeePeeMan');
insert into friends values('iTzjT','AntMan');
insert into friends values('iTzjT','TheLord');
insert into friends values('iTzjT','BigBoy');


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

insert into gameUsers values ('iTzjT',1111, 1000, 543);
insert into gameUsers values ('iTzjT',2222, 555, 200);
insert into gameUsers values ('iTzjT',3333, 2431, 421);
insert into gameUsers values ('iTzjT',4444, 1223, 212);

insert into gameUsers values ('ThePeePeeMan',4444, 1223, 212);
insert into gameUsers values ('ThePeePeeMan',2222, 555, 200);
insert into gameUsers values ('ThePeePeeMan',4444, 1223, 212);

insert into gameUsers values ('AntMan',1111, 1000, 543);
insert into gameUsers values ('AntMan',3333, 2431, 421);
insert into gameUsers values ('AntMan',4444, 1223, 212);

insert into gameUsers values ('TheLord',1111, 1000, 543);
insert into gameUsers values ('TheLord',2222, 555, 200);
insert into gameUsers values ('TheLord',3333, 2431, 421);
insert into gameUsers values ('TheLord',4444, 1223, 212);

insert into gameUsers values ('BigBoy',1111, 1000, 543);
insert into gameUsers values ('BigBoy',2222, 555, 200);
insert into gameUsers values ('BigBoy',3333, 2431, 421);
insert into gameUsers values ('BigBoy',4444, 1223, 212);

insert into gameUsers values ('DudeBro',1111, 1000, 543);
insert into gameUsers values ('DudeBro',2222, 555, 200);
insert into gameUsers values ('DudeBro',3333, 2431, 421);
insert into gameUsers values ('DudeBro',4444, 1223, 212);

insert into gameUsers values ('SniperKiller',1111, 1000, 543);
insert into gameUsers values ('SniperKiller',3333, 2431, 421);
insert into gameUsers values ('SniperKiller',4444, 1223, 212);

insert into gameUsers values ('TimeLord',1111, 1000, 543);
insert into gameUsers values ('TimeLord',2222, 555, 200);
insert into gameUsers values ('TimeLord',3333, 2431, 421);

insert into gameUsers values ('HatMan',1111, 1000, 543);
insert into gameUsers values ('HatMan',2222, 555, 200);
insert into gameUsers values ('HatMan',4444, 1223, 212);

insert into gameUsers values ('HitMan',1111, 1000, 543);
insert into gameUsers values ('HitMan',2222, 555, 200);
insert into gameUsers values ('HitMan',3333, 2431, 421);
insert into gameUsers values ('HitMan',4444, 1223, 212);

insert into gameUsers values ('PacMan',1111, 1000, 543);
insert into gameUsers values ('PacMan',2222, 555, 200);
insert into gameUsers values ('PacMan',4444, 1223, 212);
