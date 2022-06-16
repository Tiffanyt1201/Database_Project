'''
* Contains all API endpoints of the TV & MOVIE Streaming Service Lookup Web application 
'''
from flask import Flask, jsonify, request
from flask_mysqldb import MySQL
import json

app = Flask(__name__)

# Database configuration
'''
* References:  
    * Connecting to a MySQL Database in Flask Using Flask-MySQLDB (2019): https://www.youtube.com/watch?v=51F_frStZCQ&t=515s
'''
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'Bubbledophins1201!'
app.config['MYSQL_DB'] = 'cpsc471_project_db'
'''
* References: 
    * Using the DictCursor in Flask-MySQLDB: https://www.youtube.com/watch?v=wNUZyOXA66M 
'''
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

mysql = MySQL(app)

# ------------------Authentication Database Calls ---------------#
# Add information of a new user 
@app.route('/signup', methods=['POST'])
def user_signup():
    requestObj = request.get_json()
    Username = requestObj['Username']
    Email = requestObj['Email']
    Password = requestObj['Password']
    cur = mysql.connection.cursor()
    cur.execute('''CALL addUser(%s, %s, %s)''',
                [Username, Email, Password])
    results = cur.fetchone()
    cur.close()
    mysql.connection.commit()
    return json.dumps({'message': 'User updated successfully!'})

# Get information of a user
@app.route('/profile', methods=['GET'])
def get_user_details():
    if 'Email' in request.args:
        Email = request.args['Email']
    else:
        return "Error: No Email provided."
    cur = mysql.connection.cursor()
    cur.execute('''CALL getUserDetails(%s)''', [Email])
    results = cur.fetchone()
    return {'userInfo': results}

# Update information of a user 
@app.route('/profile-edit', methods=['POST'])
def update_user_details():
    requestObj = request.get_json()
    Name = requestObj['Name']
    Username = requestObj['Username']
    Email = requestObj['Email']
    Age = requestObj['Age']
    Gender = requestObj['Gender']
    Language = requestObj['Language']
    Password = requestObj['Password']
    cur = mysql.connection.cursor()
    cur.execute('''CALL updateUser(%s, %s, %s, %s, %s, %s, %s)''',
                [Name, Username, Email, Age, Gender, Language, Password])
    results = cur.fetchone()
    cur.close()
    mysql.connection.commit()
    return json.dumps({'message': 'User updated successfully!'})

# Get list of all users 
@app.route('/allusers', methods=['GET'])
def get_all_users():
    if 'Email' in request.args:
        Email = request.args['Email']
    else:
        return "Error: No Email provided."
    cur = mysql.connection.cursor()
    cur.execute('''CALL getAllUsers(%s)''', [Email])
    results = cur.fetchall()
    return {'users': results}

# Get list of all admin users 
@app.route('/admin', methods=['GET'])
def get_admin_list():
    cur = mysql.connection.cursor()
    cur.execute('''CALL getAdmin()''')
    results = cur.fetchall()
    return jsonify(results)

# ----------------------End of Auth Calls---------------------- #

# ------------------Programs (Movies/Tvshows) Database Calls ---------------#

# Get list of ALL programs (movies and tv shows)
@app.route('/allprograms', methods=['GET'])
def get_all_programs():
    cur = mysql.connection.cursor()
    cur.execute('''CALL getAllPrograms('Movie')''')
    result1 = cur.fetchall()
    cur.execute('''CALL getAllPrograms('TV Show')''')
    result2 = cur.fetchall()
    return {'movies': result1, 'tvshows': result2}

# Get list of programs that are offered by the streaming services that the user is subscribed to
'''
* References: 
    * https://programminghistorian.org/en/lessons/creating-apis-with-python-and-flask#understanding-our-database-powered-api
    * https://flask-mysqldb.readthedocs.io/en/latest/
'''
# Get list of programs that are offered by the streaming services that the user is subscribed to
@app.route('/programs', methods=['GET'])
def get_programs():
    if 'Type' and 'Email' in request.args:
        Type = request.args['Type']
        Email = request.args['Email']
    else:
        return "Error: No Type or user email prvoided."
    cur = mysql.connection.cursor()
    cur.execute('''CALL getPrograms(%s, %s)''', [Type, Email])
    results = cur.fetchall()
    return jsonify(results)

# Get details of a specific program (details include program information, program crew members and program reviews)
@app.route('/programdetails', methods=['GET'])
def get_program_details():
    # Referenced https://programminghistorian.org/en/lessons/creating-apis-with-python-and-flask#understanding-our-database-powered-api to get parameter
    if 'Uid' in request.args:
        Uid = request.args['Uid']
    else:
        return "Error: No Uid prvoided."
    cur = mysql.connection.cursor()
    cur.execute('''CALL getProgramDetails(%s, 'info')''', [Uid])
    result1 = cur.fetchone()
    cur.execute('''CALL getProgramDetails(%s, 'crew')''', [Uid])
    result2 = cur.fetchall()
    cur.execute('''CALL getProgramDetails(%s, 'reviews')''', [Uid])
    result3 = cur.fetchall()
    return {'programinfo': result1, 'programcrew': result2, 'programreviews': result3}

# Get list of programs that are leaving or coming to the streaming service that the user is subscribed to 
@app.route('/userprogramschedule', methods=['GET'])
def get_program_schedule():
    if 'Email' in request.args:
        Email = request.args['Email']
    else:
        return "Error: No Email prvoided."
    cur = mysql.connection.cursor()
    cur.execute('''CALL getUserProgramSchedule(%s, 'Coming')''', [Email])
    result1 = cur.fetchall()
    cur.execute('''CALL getUserProgramSchedule(%s, 'Leaving')''', [Email])
    result2 = cur.fetchall()
    return {'comingsoon': result1, 'leavingsoon': result2}

# Get list of all programs that are leaving or coming to for ALL streaming service
@app.route('/allprogramschedule', methods=['GET'])
def get_all_programs_schedule():
    cur = mysql.connection.cursor()
    cur.execute('''CALL getAllProgramSchedule('Coming')''')
    result1 = cur.fetchall()
    cur.execute('''CALL getAllProgramSchedule('Leaving')''')
    result2 = cur.fetchall()
    return {'comingsoon': result1, 'leavingsoon': result2}

# ----------------------End of Program Calls---------------------- #

# ------------------Crew Database Calls ---------------#

# Getting list of ALL crew meembers
@app.route('/allcrew', methods=['GET'])
def get_all_crew():
    cur = mysql.connection.cursor()
    cur.execute('''CALL getAllCrew()''')
    results = cur.fetchall()
    return jsonify(results)

# Get details of a specific crew member (details include crew member info and crew member programs)
@app.route('/crewdetails', methods=['GET'])
def get_crew_details():
    # Referenced https://programminghistorian.org/en/lessons/creating-apis-with-python-and-flask#understanding-our-database-powered-api to get parameter
    if 'Cid' in request.args:
        Cid = request.args['Cid']
    else:
        return "Error: No Cid prvoided."
    cur = mysql.connection.cursor()
    cur.execute('''CALL getCrewDetails(%s, 'info')''', [Cid])
    result1 = cur.fetchone()
    cur.execute('''CALL getCrewDetails(%s, 'programs')''', [Cid])
    result2 = cur.fetchall()
    cur.execute('''CALL getCrewDetails(%s, 'roles')''', [Cid])
    result3 = cur.fetchall()
    return {'crewinfo': result1, 'crewprograms': result2, 'crewroles': result3}

# ----------------------End of Crew Calls---------------------- #

# ------------------Favourites Database Calls ---------------#

# Get the shows that are favourited by a specific user
@app.route('/userfavs', methods=['GET'])
def get_user_fav():
    # Referenced https://programminghistorian.org/en/lessons/creating-apis-with-python-and-flask#understanding-our-database-powered-api to get parameter
    if 'Email' in request.args:
        Email = request.args['Email']
    else:
        return "Error: No user email prvoided."
    cur = mysql.connection.cursor()
    # User favourite crews
    cur.execute('''CALL getUserFavourites(%s, 'crew')''', [Email])
    result1 = cur.fetchall()
    cur.execute('''CALL getUserFavourites(%s, 'movies')''', [Email])
    result2 = cur.fetchall()
    cur.execute('''CALL getUserFavourites(%s, 'tvshows')''', [Email])
    result3 = cur.fetchall()
    return {'favouritecrew': result1, 'favouritemovies': result2, 'favouriteshows': result3}

# Remove a user favourite (can be program or crew)
@app.route('/userfavs', methods=['DELETE'])
def remove_user_fav():
    method = 'DELETE'
    # Referenced https://programminghistorian.org/en/lessons/creating-apis-with-python-and-flask#understanding-our-database-powered-api to get parameter
    if 'Email' and 'Uid' in request.args:
        Email = request.args['Email']
        Uid = request.args['Uid']
        cur = mysql.connection.cursor()
        cur.execute('''CALL manageFavourites(%s, %s, '', %s)''',
                    [Email, Uid, method])
        mysql.connection.commit()
        cur.close()
        return 'Done'
    if 'Email' and 'Cid' in request.args:
        Email = request.args['Email']
        Cid = request.args['Cid']
        cur = mysql.connection.cursor()
        cur.execute('''CALL manageFavourites(%s, '', %s, %s)''',
                    [Email, Cid, method])
        mysql.connection.commit()
        cur.close()
        return 'Done'
    else:
        return "Error: No email or id prvoided."

# Add a user favourite (can be a program or crew)
@app.route('/userfavs', methods=['POST'])
def add_user_fav():
    # Referenced https://programminghistorian.org/en/lessons/creating-apis-with-python-and-flask#understanding-our-database-powered-api to get parameter
    requestObj = request.get_json()
    Email = requestObj['Email']
    Uid = requestObj['Uid']
    Cid = requestObj['Cid']
    method = 'POST'
    cur = mysql.connection.cursor()
    cur.execute('''CALL manageFavourites(%s, %s, %s, %s)''',
                [Email, Uid, Cid, method])
    mysql.connection.commit()
    cur.close()
    return "Done"
# ----------------------End of Favourites Calls---------------------- #

# ------------------Reviews Database Calls ---------------#

# Add a new user review for a program
@app.route('/userreview', methods=['POST'])
def add_user_review():
    requestObj = request.get_json()
    Uid = requestObj['Uid']
    Email = requestObj['Email']
    Rating = requestObj['Rating']
    Description = requestObj['Description']
    cur = mysql.connection.cursor()
    cur.execute('''CALL addReview(%s, %s, %s, %s)''',
                [Uid, Email, Rating, Description])
    results = cur.fetchone()
    cur.close()
    mysql.connection.commit()
    print(results)
    return jsonify(results)

# ----------------------End of Reviews Calls---------------------- #

# ------------------Services Database Calls ---------------#

# Get all services the user is subscribed to
@app.route('/usersubscriptions', methods=['GET'])
def get_user_subs():
    # Referenced https://programminghistorian.org/en/lessons/creating-apis-with-python-and-flask#understanding-our-database-powered-api to get parameter
    if 'Email' in request.args:
        Email = request.args['Email']
    else:
        return "Error: No Email prvoided."
    method = 'GET'
    cur = mysql.connection.cursor()
    cur.execute('''CALL manageUserService(%s, '', %s)''', [Email, method])
    result = cur.fetchall()
    return jsonify(result)

# Add new subscribed service for the user
@app.route('/usersubscriptions', methods=['POST'])
def add_user_sub():
    requestObj = request.get_json()
    Email = requestObj['Email']
    Service_name = requestObj['Service_name']
    method = 'POST'
    cur = mysql.connection.cursor()
    cur.execute('''CALL manageUserService(%s, %s, %s)''',
                [Email, Service_name, method])
    mysql.connection.commit()
    cur.close()
    return "Done!"

# Remove a user subscription service
@app.route('/usersubscriptions', methods=['DELETE'])
def delete_user_sub():
    requestObj = request.get_json()
    Email = requestObj['Email']
    Service_name = requestObj['Service_name']
    method = 'DELETE'
    cur = mysql.connection.cursor()
    cur.execute('''CALL manageUserService(%s, %s, %s)''',
                [Email, Service_name, method])
    mysql.connection.commit()
    cur.close()
    return "Done!"

# Get list of ALL available streaming services
@app.route('/services', methods=['GET'])
def get_all_services():
    # Referenced https://programminghistorian.org/en/lessons/creating-apis-with-python-and-flask#understanding-our-database-powered-api to get parameter
    cur = mysql.connection.cursor()
    cur.execute('''CALL getServices()''')
    result = cur.fetchall()
    return jsonify(result)

# ----------------------End of Services Calls---------------------- #


if __name__ == "__main__":
    app.run(debug=True)
