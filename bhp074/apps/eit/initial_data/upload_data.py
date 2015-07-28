#!/usr/bin/python
# upload_survey.py - 

__author__ = "Erik van Widenfelt (ewidenfelt)"
__version__ = "Revision: 1.0"
__date__ = "Date:  2010/11/18 21:57:19"
__copyright__ = "Copyright (c) 2010 Erik van Widenfelt"
__license__ = "Python"

import sys, getpass
#import argparse
import MySQLdb

def main(argv):

#   parser = argparse.ArgumentParser(description='Import data from daily household survey activity.')
#    parser.add_argument('f', help='mysqldump file of INSERT statements')
#    parser.add_argument('-p', help='password')
    
#    args = parser.parse_args()

    msg = "Usage: python %s -u USER [ -p ] -f file.sql" % (sys.argv[0])

    argcount = len(sys.argv)
    if sys.argv.count < 5:
        print "Incorrect number of arguments"
	print msg
        sys.exit (1)

    user = ""
    passwd = ""
    filename = ""    

    for i in range( 1, argcount ):
        if sys.argv[i] == "-u" and i+1 <=len(sys.argv):
            user = sys.argv[i+1]
        elif sys.argv[i] == "-p":
            passwd = getpass.getpass("MySQL Password ([Enter] for 'none'):")
        elif sys.argv[i] == "-f" and i+1 <=len(sys.argv):
            filename = sys.argv[i+1]

    if user == "":
        print "Specify a user, -u"
        print msg
        print "%s %s\n%s" % (sys.argv[0], __version__, __copyright__)
        sys.exit (1)        

    if filename == "":
        print "Specify a filename, -f" 
        print msg
        print "%s %s\n%s" % (sys.argv[0], __version__, __copyright__)
        sys.exit (1)      


    #try to connect
    try:
        conn = MySQLdb.connect (
            host = "localhost",
            user = user,
            passwd = passwd,
            db = "bhp056_training")

    except MySQLdb.Error, e:
        print "Error %d: %s" % (e.args[0], e.args[1])
        sys.exit (1)

    # retrieve and display database server version
    cursor = conn.cursor ()
    cursor.execute ("SELECT VERSION()")
    row = cursor.fetchone ()
    
    print "...ok, connected - server version:", row[0]
    cursor.close()

    
    try:
        print "...trying to open sql file"
        cursor = conn.cursor ()
        
        #sql=open(filename).read()
        #print "...ok"
        #print "...trying to execute sql file"
        #cursor.execute(sql)
        sql_file = open(filename).readlines()        
        line_number=0
        print "...ok"
         
        for ln in sql_file:
            line_number+=1
            if ln.count("insert")>0:
                 cursor.execute(ln)

        cursor.close ()
        conn.commit ()
        print "...ok, Success!"
  

    except MySQLdb.Error, e:
        print "...import failed at line %i, rolling back. Error was: " % (line_number)
        print "Error %d: %s" % (e.args[0], e.args[1])
        print ln
        try:
            conn.rollback ()
        except:
            pass

        
if __name__ == "__main__":
    main(sys.argv[1:])

