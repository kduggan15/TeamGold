// Based on https://github.com/ericf/express-handlebars

const port = 3000;
const express = require('express');
const hb  = require('express-handlebars');
const app = express();

const mysql = require('mysql');
const connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'password',
  database : 'Gold'
});

const query_test_select = 'SELECT * FROM Test ORDER BY EmplId;';
const query_test_insert = 'INSERT INTO Test (EmplId, Name, HireDate) VALUES (?, ?, ?);';

app.engine('handlebars', hb({defaultLayout: 'index'}));
app.set('view engine', 'handlebars');
app.use(express.urlencoded());

//app.get('/', function (req, res) {
//    connection.query(query_test_select, (error, results, fields) => {
//        if (error) {
//            throw error;
//        }
//
//        res.render('home', { results });
//    });
//
//});

app.get('/api/allclan', (req, res) => {
    const select_all_clan = 'SELECT * FROM Team ORDER BY Clan;';
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
    const select_users = "SELECT * FROM Team WHERE Clan = '" + req.params.clan + "' ORDER BY Role;";
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

    const statement = 'INSERT INTO Team (Clan, User, Game, Role) VALUES (?, ?, ?, ?);';

    connection.query(statement, [clan, user, game, role], (error, results, fields) => {
        if (error) {
            throw error;
        }
        console.log(`User: ${user} is created succesfully.`);
        res.redirect('/api/allclan');
    });
});


//Jon's Code 

const myProfile = "select distinct * from users natural join usersprofiles natural join gameUsers, games where users.userName='itzjt' and gameUsers.gameID = games.gameID;"
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
})
app.get('/user/:userName', function(req, res){
    var userName = req.params.userName;
    const userProfile = "select distinct * from users natural join usersprofiles natural join gameUsers, games where users.userName='" + userName + "' and gameUsers.gameID = games.gameID;"    
    connection.query(userProfile, (error,results,fields) =>{
        if(error){
            throw error;
        }
        console.log(results);
        res.render('otherProfiles', { results });
    })
})


app.listen(3000);
