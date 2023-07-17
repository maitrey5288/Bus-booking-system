from flask import Flask, render_template, url_for, redirect
from flask_sqlalchemy import SQLAlchemy
from flask_login import UserMixin, login_user, LoginManager, login_required, logout_user, current_user
from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField
from wtforms.validators import InputRequired, Length, ValidationError
from flask_bcrypt import Bcrypt 
from flask import request , session
import sql
import datetime
import json
app = Flask(__name__)  
# db = SQLAlchemy(app)
# bcrypt = Bcrypt(app)
# app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///database.db'
# app.config['SECRET_KEY'] = 'thisisasecretkey'




db = SQLAlchemy(app)
bcrypt = Bcrypt(app)
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql://root:2461@localhost/bookbus'
app.config['SECRET_KEY'] = 'thisisasecretkey'


login_manager = LoginManager()
login_manager.init_app(app)
login_manager.login_view = 'login'


@login_manager.user_loader
def load_user(user_id):
    return User_details.query.get(int(user_id))


class User_details(db.Model, UserMixin):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(20), nullable=False, unique=True)
    password = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(50), nullable=False, unique = True)


# class RegisterForm(FlaskForm):
#     username = StringField(validators=[
#                            InputRequired(), Length(min=4, max=20)], render_kw={"placeholder": "Username"})

#     password = PasswordField(validators=[
#                              InputRequired(), Length(min=8, max=20)], render_kw={"placeholder": "Password"})

#     submit = SubmitField('Register')

#     def validate_username(self, username):
#         existing_user_username = User.query.filter_by(
#             username=username.data).first()
#         if existing_user_username:
#             raise ValidationError(
#                 'That username already exists. Please choose a different one.')


# class LoginForm(FlaskForm):
#     username = StringField(validators=[
#                            InputRequired(), Length(min=4, max=20)], render_kw={"placeholder": "Username"})

#     password = PasswordField(validators=[
#                              InputRequired(), Length(min=8, max=20)], render_kw={"placeholder": "Password"})

#     submit = SubmitField('Login')



@app.route('/')
def home():
    return redirect('/login')




@app.route('/search_bus', methods =["GET", "POST"])  
@login_required
def search_bus():
    
    if request.method == "POST":
       # input with name = fname in HTML form
        froms = request.form.get("fromstation")
        tos = request.form.get("tostation")
        date = request.form.get('dateoftravel')
       # getting input with name = lname in HTML form
        # sql.insert_info(froms,tos)
        date = datetime.datetime.strptime(date, '%Y-%m-%d').strftime('%Y-%d-%m')
        print('ih')
        print(date)
        session['tmpdate'] = date
        sql.search_stations(froms,tos,date)
        # sql.commit()
        print(froms)
        print(tos)
        print(date)

        buslist = sql.buslist
        sql.boarding_pts()
        boarding_pts = sql.boarding_pts_list
        sql.droping_pts()
        droping_pts = sql.droping_pts_list
        sql.buslist = []
        sql.boarding_pts_list ={}
        sql.droping_pts_list = {}
        # for i in buslist:
        #     print(type(i[0]))
        #     for j in boarding_pts[i[0]]:
        #         print(j)
        return render_template('pagetmp.html',buslist=buslist,boarding_pts=boarding_pts,droping_pts=droping_pts,froms =froms ,tos=tos)

    return render_template ('index.html')
  
@app.route('/login', methods=['GET', 'POST'])
def login():
   
    if request.method == "POST":
        email_id =  request.form.get("email_id")
        passwd = request.form.get("password")
        user = User_details.query.filter_by(email=email_id).first()
        if user:
            if bcrypt.check_password_hash(user.password, passwd):
                login_user(user)
                session['username'] = user.username
                session['userid'] = user.id
                print(session['userid'])
                return redirect(url_for('dashboard'))
    return render_template('login.html')


@app.route('/dashboard', methods=['GET', 'POST'])
@login_required
def dashboard():
    return render_template('dashboard.html',username = session['username'],gbuid=session['userid'])

@app.route('/viewseats/<int:bus_id>', methods=['GET', 'POST'])
@login_required
def viewseats(bus_id):
    sql.viewseats(session['userid'],bus_id,session['tmpdate'])
    a=sql.avl_seats
    
    if request.method == "POST":
        seat_id = request.form.getlist("seat")
        session['seat_id']  =seat_id
    print('aa')
    print(a)    
    return render_template('view_seats.html',available_seat=a)

@app.route('/tmp', methods=['GET', 'POST'])
# @login_required
def dashbkoarkd():
    
    
    return render_template('tmp.html',available_seat=['1A','1C'])

@app.route('/logout', methods=['GET', 'POST'])
@login_required
def logout():
    logout_user()
    session.pop('username')
    session.pop('tmpdate')
    session.pop('userid')
    return redirect(url_for('login'))


@ app.route('/register', methods=['GET', 'POST'])
def register():
    
    
    if request.method == "POST":
        email = request.form.get("email_id")
        uname =  request.form.get("user_name")
        passwd = request.form.get("password")
        hashed_password = bcrypt.generate_password_hash(passwd)
        new_user = User_details(username=uname, password=hashed_password , email = email)
        db.session.add(new_user)
        db.session.commit()
        return redirect(url_for('login'))

    return render_template('login.html')


@app.route('/bookseat/<int:bus_id>',methods=['GET', 'POST'])
def bookseat(bus_id):
    sql.chech_val_seats(session['seat_id'])
    # date,bus_id,userid,passanger_name,ps_age,ps_gender,booking_id,seat_id
    if request.method == "POST":
        ps_age = request.form.getlist("ps_age")
        ps_name =  request.form.getlist("ps_name")
        ps_gender = request.form.getlist("gender")
        date = session['tmpdate']
        userid= session['userid']
        seat_id = session['seat_id']
        booking_id = sql.currbookingid()
        sql.bookseat(date=date,bus_id=bus_id,userid=userid,passanger_name=ps_name,ps_age=ps_age,ps_gender=ps_gender,booking_id=booking_id,seat_id=seat_id)

    # sql.bookseat(gbtmpdate,bus_id,gbuid,)
    return render_template('passanger_details.html')

if __name__ == "__main__":
    app.run(debug=True)
