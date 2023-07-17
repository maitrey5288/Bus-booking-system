
import mysql.connector
import datetime
mydb = mysql.connector.connect(
user = 'root',
password = '2461',
host = '127.0.0.1',
port = 3306,
database = 'bookbus',

)


# name = "maitrey"
# id = 6

	

def commit():
	mydb.commit()
# insert_info(name , id)
# cursor.execute(f'insert into website values("{name}",{id})')
# cursor.execute("select * from website")
# for x in cursor:
#   print(x)
# search_stations('Pune',"Mumbai")

buslist=[]
boarding_pts_list ={}
droping_pts_list = {}
def search_stations(froms,tos,date):
	cursor = mydb.cursor()
	cursor.execute(f'''
	select * from buses_info where bus_source = "{froms}" and bus_destination = "{tos}" and bus_date = '{date}';
	
	''')
	print(f'select * from buses_info where bus_source = "{froms}" and bus_destination = "{tos}" and bus_date = "{date}";')
	
	for i in cursor:
		buslist.append(i)
	cursor.close()
def boarding_pts():
	cursor = mydb.cursor()
	for i in buslist:
		cursor.execute(f'''
		select * from boarding_pts where bus_id = {i[0]};
		
		''')
		tmp = []
		for j in cursor:
			tmp.append(j[1])
		boarding_pts_list[int(i[0])] = tmp
	# print(boarding_pts_list)		
	cursor.close()

def droping_pts():
	cursor = mydb.cursor()
	for i in buslist:
		cursor.execute(f'''
		select * from droping_pts where bus_id = {i[0]};
		
		''')
		tmp1 = []
		for j in cursor:
			tmp1.append(j[1])
		droping_pts_list[int(i[0])] = tmp1
	cursor.close()
	
	
avl_seats=[]
def viewseats(uid,bus_id,date):
	global avl_seats
	avl_seats = []
	cursor = mydb.cursor()
	seater_or_sleeper = None
	cursor.execute(f'''
		select * from buses_info where bus_id = {bus_id};
		
		''')
	for j in cursor:
		seater_or_sleeper = j[10]	
	cursor.close()

	cursor1 = mydb.cursor()	
	if seater_or_sleeper == 'non':
		cursor1.execute(f'''
			select seat_info.seatnumber from seat_info, seatbooking,buses_info where NOT seat_info.seatnumber = seatbooking.seatid and seatbooking.bus_id = '{bus_id}' and seat_info.seater='1' and seatbooking.bus_date='{date}';	
			''')
		print((f'''
			select seat_info.seatnumber from seat_info, seatbooking,buses_info where NOT seat_info.seatnumber = seatbooking.seatid and seatbooking.bus_id = '{bus_id}' and seat_info.seater='1' and seatbooking.bus_date='{date}';	
			'''))	

	elif seater_or_sleeper == 'sleeper':
		cursor1.execute(f'''
			select seat_info.seatnumber from seat_info, seatbooking,buses_info where NOT seat_info.seatnumber = seatbooking.seatid and seatbooking.bus_id = '{bus_id}' and seat_info.sleeper='1' and seatbooking.bus_date='{date}';
			''')	
		print((f'''
			select seat_info.seatnumber from seat_info, seatbooking,buses_info where NOT seat_info.seatnumber = seatbooking.seatid and seatbooking.bus_id = '{bus_id}' and seat_info.sleeper='1' and seatbooking.bus_date='{date}';
			'''))		
	for k in cursor1:
			avl_seats.append(k[0])
	cursor1.close()			

def currbookingid():
	cursor = mydb.cursor()
	
	cursor.execute(f'''
			select max(bookingid) from seatbooking ;
			''')
	for j in cursor:
		bookingid = j[0]		
	cursor.close()	
	return bookingid 


	# select max(bookingid) from seatbooking ;
def bookseat(date,bus_id,userid,passanger_name,ps_age,ps_gender,booking_id,seat_id):
	cursor = mydb.cursor()
	for i in len(passanger_name):
		cursor.execute(f'''
			insert into booking_details values ({booking_id} , '{passanger_name[i]}',{ps_age[i]},'{ps_gender[i]}')
			''')
	cursor.close()		

	cursor1 = mydb.cursor()
	for j  in seat_id:
		cursor1.execute(f'''
			insert into seatbooking values({booking_id},{userid},sysdate(),200.00,'1','{j}' ,'{bus_id}','{date}')
			''')
	cursor1.close()

	cursor2 = mydb.cursor()
	for k  in len(seat_id):
		cursor1.execute(f'''
			update buses_info set avl_seats = avl_seats-1 where bus_id = {bus_id};
			''')
	cursor2.close()


def chech_val_seats(seat_id):
	global avl_seats
	error = False
	for i in seat_id :
		if i in avl_seats:
			error = False
		else :
			error = True
	if error:

		return False
	else:
		return True	 			
	

