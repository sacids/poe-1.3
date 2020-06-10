import psycopg2, random
from faker import Faker
from datetime import datetime

conn = psycopg2.connect("dbname=poe_db user=all password=kitimoto")

fake = Faker()

cur             = conn.cursor()
sql             = "INSERT INTO et_travellers VALUES " 
for i in range(40):
    if(i > 0):
        sql += ","
    sql += ("(default,'1','"+
            str(datetime.today().strftime('%Y-%m-%d'))+"','"+
            fake.name()+"','"+
            "INTERNATIONAL','"+
            random.choice(['male','female'])+"','"+
            str(random.randint(2,88))+"','"+
            random.choice(['passport-number','national-id'])+"','"+
            fake.ssn()+"','"+
            random.choice(['government','non-government','non-profit','student','business','religious'])+"','','"+
            random.choice(['flight','vehicle','vessel'])+"','"+
            fake.pystr()+"','"+
            str(random.randint(2,88))+"','"+
            str(datetime.today().strftime('%Y-%m-%d'))+"','"+
            random.choice(['resident','tourist','transit','business'])+"','','"+
            fake.address()+"','"+
            fake.company()+"','"+
            fake.address()+"','"+
            fake.msisdn()+"','"+
            fake.email()+"','"+
            str(round(random.uniform(34.50, 41.50), 2))+"','0','"+
            random.choice(['SECONDARY_SCREENING','PROCEED','HOLD'])+"','"+
            str(datetime.today().strftime('%Y-%m-%d'))+"','"+
            str(random.randint(1,4))+"','"+
            str(random.randint(1,3))+"')"
        )

##print(sql)

cur.execute(sql)
conn.commit()
cur.close()
conn.close()


