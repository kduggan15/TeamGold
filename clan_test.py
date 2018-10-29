#!/usr/bin/env python
import sys
import random

import mysql.connector
from mysql.connector import errorcode

config = {
    "user": 'root',
    "password": '756710296Born',
    "host": '127.0.0.1',
    "database": 'gold'
}

def create_random_clan():
    clan = ("Red", "Yellow", "Orange", "Yellow", "Green", "Blue", "Indigo", "Violet")
    return random.choice(clan)

def create_random_user(num):
    last = ("Turing", "Church", "Curry", "Hopper", "Lovelace", "Allen", "Liskov")
    first = ("Allan", "Haskell", "Alonzo", "Grace", "Ada", "Frances", "Barbara")
    # for i in range(0, len(last)):
    return " ".join((first[num], last[num]))

    # return " ".join((random.choice(first), random.choice(last)))

def create_random_game():
    game = ("Fortnite: Battle Royale", "Grand Theft Auto V", "PlayerUnknown's Battlegrounds",
            "Minecraft", "Overwatch","Rocket League", "League Of Legends","Super Mario Odyssey", 
            "Roblox","Counter-Strike: Global Offensive", "The Legend Of Zelda: Breath Of The Wild",
            "Battlefield 1", "Call Of Duty: WWII","Call Of Duty: Black Ops II", "FIFA 18",
            "Assassin's Creed Origins", "Super Smash Bros","The Elder Scrolls V: Skyrim", "Star Wars Battlefront II is a 2017")
    return random.choice(game)

def create_random_record(num):
    for _ in range(num):
        clan = create_random_clan()
        user = create_random_user(_)
        game = create_random_game()
        yield (clan, user, game)

# def create():
def create(cursor):
    for info in create_random_record(7):
        clan, user, game, *_ = info
        # clan, user, game = info
        qry = "INSERT INTO Team (Clan, User, Game, Role) VALUES (%s, %s, %s, %s);"
        cursor.execute(qry, (clan, user, game, "Member"))

def query(cursor):
    qry = ("SELECT User, Clan, Game From Team;")
    cursor.execute(qry)
    print("*" * 80)
    for (user, clan, game) in cursor:
        print(f"{user}: {clan}, {game}")
    print("*" * 80)

def main():
    if len(sys.argv) != 2 or sys.argv[1] not in {"create", "query"}:
        print(f"USAGE: {sys.argv[0]} (create | query)")
        sys.exit(-1)
    
    try:
        cnx = mysql.connector.connect(**config)
        cursor = cnx.cursor()
        if sys.argv[1] == "create":
            create(cursor)
            cnx.commit()
        elif sys.argv[1] == "query":
            query(cursor)
    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Incorrct useruser or password")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("Database does not exist")
        else:
            print(err)
        raise err
    else:
        cnx.close()

if __name__ == '__main__':
    main()

        


