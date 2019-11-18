# TeamGold
A database to find gamers who play the same game



### How to run:

- Download the code.
- Navigate to inside the project folder on terminal.
- Do an npm install for installing all the projects dependencies.
- Go to app.js and change the user name and password to match your mySQL credentials.

```javascript
const connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',      <---
  password : 'password',  <--- 
  database : 'Gold'
});
```

- Then run the golddatabase script to build the database in mySQL.
- Then do **npm start** or **node app.js** or **nodemon app.js** to get the app running. (**nodemon app.js** worked for me).

- Go to <http://localhost:3000/>.

#### Demo

##### Exploring the site:

![exploring the site](./exploring_the_site.gif)

- Each game page contains details about the game itself and users who played the game. 

#### The social media aspect of the site:

![social media aspect](./social_media_aspect.gif)

- In order to explore relational databases we decided that a social media site was the best way to show our knowledge. Users are related to the games they play and other users through the friends list.



Trigger Ideas
When you try to add yourself as a friend.
totalHours in gameUsers can not go down.
gameVideo should be unique. 
Gamerscore can not decrease.

Procedures ideas
Instead of sql statement for clan. use procedures. 
Instead of sql statement for adding friends. use procedures. h