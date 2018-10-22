// Based on https://github.com/ericf/express-handlebars

const port = 3000;
const express = require('express');
const hb  = require('express-handlebars');
const app = express();

const mysql = require('mysql');
const connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'FakeStudent',
  password : 'password',
  database : 'FakeStudent'
});

const query_test_select = 'SELECT * FROM Test ORDER BY EmplId;';
const query_test_insert = 'INSERT INTO Test (EmplId, Name, HireDate) VALUES (?, ?, ?);';

app.engine('handlebars', hb({defaultLayout: 'main'}));
app.set('view engine', 'handlebars');
app.use(express.urlencoded());

app.get('/', function (req, res) {
    connection.query(query_test_select, (error, results, fields) => {
        if (error) {
            throw error;
        }

        res.render('home', { results });
    });

});

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
app.listen(3000);
