// const port = 5000;
const express = require('express');
const hb = require('express-handlebars');
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
// app.use(express.static('public'));

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

// app.listen(5000);

const port = process.env.PORT || 5000;
app.listen(port, () => console.log(`Listending on port ${port}...`));