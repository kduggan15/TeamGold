// Based on https://github.com/ericf/express-handlebars

const port = 3000;
const express = require('express');
const hb  = require('express-handlebars');
const app = express();

const mysql = require('mysql');
const connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '756710296Born',
  database : 'Gold'
});


app.engine('handlebars', hb({defaultLayout: 'index'}));
app.set('view engine', 'handlebars');
app.use(express.urlencoded());

app.get('/', function (req, res) {
    const select_game_scores = 'SELECT users.userName, games.gameName, gameUsers.score FROM users natural join gameUsers natural join games order by gameUsers.score desc;';
    connection.query(select_game_scores, (error, results, fields) => {
        if (error) {
            throw error;
        }

        res.render('home', { results });
    });

});

app.get('/Games', function (req, res) {
    let result1, result2;
    connection.query('SELECT * FROM games', (error, results, fields) => {
                if (error) {
                    throw error;
                }
        
               
                res.render('gamepage',{'games':results,
                topGames:[
                    {"name":"Black Ops 4","page":"https://www.google.com/search?tbm=isch&q=blackops4"},
                    {"name":"Fortnite","page":"https://www.google.com/search?tbm=isch&q=Fortnite"},
                    {"name":"CS:GO","page":"https://www.google.com/search?tbm=isch&q=CSGO"},
                    {"name":"League Of Legends","page":"https://www.google.com/search?tbm=isch&q=LeagueOfLegends"},
                    {"name":"Rainbow Six Seige","page":"https://www.google.com/search?tbm=isch&q=RainbowSixSiege"},
                    {"name":"Overwatch","page":"https://www.google.com/search?tbm=isch&q=OverWatch"},
                    {"name":"Assassins Creed","page":"https://www.google.com/search?tbm=isch&q=AssassinsCreed"},
                ]});
            
           
        });

      
        

       
   /*

    res.render('gamePage',{games:[
        {"gameID":"1","name":"RainbowSixWiege","image":"https://gearnuke.b-cdn.net/wp-content/uploads/2016/01/rainbow-six-siege.jpg"},
        {"gameID":"2","name":"Black Ops 4","image":"https://i.redd.it/hf77kkmbmmy01.jpg"},
        {"gameID":"3","name":"Fortnite","image":"https://static-assets-prod.epicgames.com/fortnite/static/webpack/8704d4d5ffd1c315ac8e2c805a585764.jpg"},
        {"gameID":"4","name":"CSGO","image":"https://www.hdwallpaper.nu/wp-content/uploads/2015/10/maxresdefault44.jpg"},
        {"gameID":"5","name":"League Of Legends","image":"https://www.foxsportsasia.com/uploads/2018/05/LoL-Banner.jpg"},
        {"gameID":"6","name":"Assassinscreed","image":"https://hb.imgix.net/74e8d7c2ec7dde490abf64d54f9828fa073ae4e3.jpg?auto=compress,format&fit=crop&h=353&w=616&s=6b9af392df9564413a51c35a14a3c6d1"},
        {"gameID":"7","name":"overwatch","image":"https://d3hmvhl7ru3t12.cloudfront.net/img/logos/overwatch-share-3d5a268515283007bdf3452e877adac466d579f4b44abbd05aa0a98aba582eeaebc4541f1154e57ec5a43693345bebda953381a7b75b58adbd29d3f3eb439ad2.jpg"},
        {"gameID":"8","name":"RRR2","image":"https://i.ytimg.com/vi/9KiSwbFmu0E/maxresdefault.jpg"},
        {"gameID":"9","name":"Minecraft","image":"https://compass-ssl.xbox.com/assets/0f/e2/0fe20042-0bb8-4781-82f4-7130f928b021.jpg?n=Minecraft-2017_Superhero-0_Keyart_767x431.jpg"}

    ],
    topGames:[
        {"name":"Black Ops 4","page":"https://www.google.com/search?tbm=isch&q=blackops4"},
        {"name":"Fortnite","page":"https://www.google.com/search?tbm=isch&q=Fortnite"},
        {"name":"CS:GO","page":"https://www.google.com/search?tbm=isch&q=CSGO"},
        {"name":"League Of Legends","page":"https://www.google.com/search?tbm=isch&q=LeagueOfLegends"},
        {"name":"Rainbow Six Seige","page":"https://www.google.com/search?tbm=isch&q=RainbowSixSiege"},
        {"name":"Overwatch","page":"https://www.google.com/search?tbm=isch&q=OverWatch"},
        {"name":"Assassins Creed","page":"https://www.google.com/search?tbm=isch&q=AssassinsCreed"},
    ]
});
    
*/
});

app.get('/Games/:gameID', function (req, res) {
    console.log(req.params);
    var game = {name:"Black Ops 4",description:
    "Lorwerwerem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officiae deserunt mollit anim id est laborum."
    ,tags:[{"tag":"FPS,"},{"tag":"Shooter,"},{"tag":"Zombies,"},{"tag":"Battle Royale"}],developer:"Activision, Treyarch",imageURL:"https://i.redd.it/hf77kkmbmmy01.jpg",videoURL:"https://www.youtube.com/embed/6kqe2ICmTxc"};

    if (req.params.gameID === '3')
        game = {name:"Fortnite",description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officiae deserunt mollit anim id est laborum."
        ,tags:[{"tag":"FPS,"},{"tag":"Shooter,"},{"tag":"Zombies,"},{"tag":"Battle Royale"}],developer:"Epic Games",imageURL:"https://static-assets-prod.epicgames.com/fortnite/static/webpack/8704d4d5ffd1c315ac8e2c805a585764.jpg",videoURL:"https://www.youtube.com/embed/2gUtfBmw86Y"};
    

    res.render('specificGamePage',{
        Game:game,
        topPlayers:[
        {"name":"Person1","page":"https://www.google.com/search?tbm=isch&q=blackops4"},
        {"name":"Person2","page":"https://www.google.com/search?tbm=isch&q=Fortnite"},
        {"name":"Person3","page":"https://www.google.com/search?tbm=isch&q=CSGO"},
        {"name":"Person4","page":"https://www.google.com/search?tbm=isch&q=LeagueOfLegends"},
        {"name":"Person5","page":"https://www.google.com/search?tbm=isch&q=RainbowSixSiege"},
        
        
       
    ],mostHours:[
        {"name":"Person1","page":"https://www.google.com/search?tbm=isch&q=blackops4","hours":2672},
        {"name":"Person2","page":"https://www.google.com/search?tbm=isch&q=Fortnite","hours":1024},
        {"name":"Person3","page":"https://www.google.com/search?tbm=isch&q=CSGO","hours":1000},
        {"name":"Person4","page":"https://www.google.com/search?tbm=isch&q=LeagueOfLegends","hours":536},
        {"name":"Person5","page":"https://www.google.com/search?tbm=isch&q=RainbowSixSiege","hours":123}
       
    ],AllPlayers:[
        {"playerName":"Person1","profileImage":"https://i.redd.it/hf77kkmbmmy01.jpg"},
        {"playerName":"Person2","profileImage":"https://i.redd.it/hf77kkmbmmy01.jpg"},
        {"playerName":"Person3","profileImage":"https://hb.imgix.net/74e8d7c2ec7dde490abf64d54f9828fa073ae4e3.jpg?auto=compress,format&fit=crop&h=353&w=616&s=6b9af392df9564413a51c35a14a3c6d1"},
        {"playerName":"Person4","profileImage":"https://i.redd.it/hf77kkmbmmy01.jpg"},
        {"playerName":"Person5","profileImage":"https://hb.imgix.net/74e8d7c2ec7dde490abf64d54f9828fa073ae4e3.jpg?auto=compress,format&fit=crop&h=353&w=616&s=6b9af392df9564413a51c35a14a3c6d1"},
        {"playerName":"Person1","profileImage":"https://i.redd.it/hf77kkmbmmy01.jpg"},
        {"playerName":"Person2","profileImage":"https://i.redd.it/hf77kkmbmmy01.jpg"},
        {"playerName":"Person3","profileImage":"https://hb.imgix.net/74e8d7c2ec7dde490abf64d54f9828fa073ae4e3.jpg?auto=compress,format&fit=crop&h=353&w=616&s=6b9af392df9564413a51c35a14a3c6d1"},
        {"playerName":"Person4","profileImage":"https://i.redd.it/hf77kkmbmmy01.jpg"},
        {"playerName":"Person5","profileImage":"https://hb.imgix.net/74e8d7c2ec7dde490abf64d54f9828fa073ae4e3.jpg?auto=compress,format&fit=crop&h=353&w=616&s=6b9af392df9564413a51c35a14a3c6d1"}
       
    ]
    
    
    
    });

});



app.get('/gamePage.css', function (req, res) {
    res.sendFile(__dirname + '/css/gamePage.css')
});

app.get('/specificGamePage.css', function (req, res) {
    res.sendFile(__dirname + '/css/specificGamePage.css')
});

app.get('/css/home.css', function (req, res) {
    res.sendFile(__dirname + '/css/home.css')
});

app.get('/api/allclan', (req, res) => {
    const select_all_clan = 'SELECT * FROM team ORDER BY Clan;';
    connection.query(select_all_clan, (error, results, fields) => {
        if (error) {
            throw error;
        }
        res.render('allclan', { results });
    });
});
app.get('/css/allclan.css', function (req, res) {
    res.sendFile(__dirname + '/css/allclan.css')
});

app.get('/api/clanpage/:clan', (req, res) => {
    const select_users = "SELECT * FROM team WHERE Clan = '" + req.params.clan + "' ORDER BY Role;";
    connection.query(select_users, (error, results, fields) => {
        if (error) {
            throw error;
        }
        res.render('allclan', { results });
    });
});

app.get('/api/create_clan_form', (req, res) => {
    res.render('createclanform');
});

app.post('/api/createclan', (req, res) => {
    const user = req.body.user;
    const clan = req.body.clan;
    const game = req.body.game;
    const role = req.body.role;

    const statement = 'INSERT INTO team (Clan, User, Game, Role) VALUES (?, ?, ?, ?);';

    connection.query(statement, [clan, user, game, role], (error, results, fields) => {
        if (error) {
            throw error;
        }
        console.log(`User: ${user} is created succesfully.`);
        res.redirect('/api/allclan');
    });
});


//Jon's Code

const myProfile = "select distinct * from users natural join usersProfiles natural join gameUsers, games where users.userName='itzjt' and gameUsers.gameID = games.gameID;"
app.get('/user/myprofile', function(req, res){
    connection.query(myProfile, (error, results, fields) => {
        if(error){
            throw error;
        }
        console.log(results);
        console.log('My Profile has been loaded...')
        res.render('mainProfilePage', { results });
    });

});
app.get('/user/myprofile/friendslist', function(req, res){
    const viewFriendsandPictures = "select distinct profilepictures, userFriend from friends, usersProfiles where friends.userName = 'iTzjT' and usersProfiles.userName = friends.userFriend;"
    connection.query(viewFriendsandPictures, (error, results, friends)=>{
        if(error){
            throw error;
        }
        console.log(results);
        console.log("My friends list has loaded...")
        res.render("mainProfilefriendsList",{results});
    })
});

const viewFriends = 'select userFriend from friends where userName = "iTzjT";';

app.get('/user/:userName/friendslist', function(req, res){
    const viewFriendsandPictures = "select distinct profilepictures, userFriend from friends, usersProfiles where friends.userName = '" + req.params.userName + "' and usersProfiles.userName = friends.userFriend;"
    connection.query(viewFriendsandPictures, (error, results, friends)=>{
        if(error){
            throw error;
        }
        console.log(results);
        console.log("My friends list has loaded...")
        res.render("friendsList",{results});
    })
});
app.get('/user/:userName', function(req, res){
    var userName = req.params.userName;
    const userProfile = "select distinct * from users natural join usersprofiles natural join gameUsers, games where users.userName='" + userName +"' and gameUsers.gameID = games.gameID;"

    connection.query(userProfile, (error,results,fields) =>{
        if(error){
            throw error;
        }
        console.log(results);
        res.render('otherProfiles', { results });
    })
});
app.get('/user/:userName/addfriend', function(req, res){
    const addfriend_query = "insert into friends values('iTzjT','" + req.params.userName + "');"
    connection.query(addfriend_query,(error,results,fields)=>{
        if(error){
            throw error;
        }
        console.log('it worked LOL.....');
        res.redirect('/user/'+ req.params.userName);
    })
});
app.get('/user/:userName/removeFriend', function(req, res){
    const addfriend_query = "Delete from friends where userName ='iTzjT' and userFriend ='" + req.params.userName + "';"
    connection.query(addfriend_query,(error,results,fields)=>{
        if(error){
            throw error;
        }
        console.log('Friend removed lol bye bye');
        res.redirect('/user/myprofile/friendslist');
    })
})



app.listen(3000);
