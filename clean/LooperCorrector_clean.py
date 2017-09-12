#!/usr/bin/env python

import os

#first, read in lines from old .C file
f = open("BBB","r")
C_lines = f.readlines()
f.close()

#open new .C file for writing
g = open("Looper.C","w")
for line in C_lines:
    g.write(line)
    if line == "   // The return value is currently not used.\n": #when you find the line to match
        g.write("   if (entry == -1) {\n" +
                "      return kFALSE;\n   }") #fill in the extra content
g.close()

#read in the lines from the old .h file
h = open("CCC","r")
h_lines = h.readlines()
h.close()
j = open("Looper.h","w")

include_flag = 0 #this flag is to let you know if you've found one occurence of the include
for line in h_lines:
    if (include_flag == 0 and line == "#include <vector>\n"):
        j.write(line)
        j.write("\nusing namespace std;\n") #write the include once, with the namespace
        include_flag = 1
    if (line != "#include <vector>\n" and line != "   ClassDef(Looper,0);\n"):
        j.write(line) #if the line doesn't match any special cases, write it
    if (line == "   ClassDef(Looper,0);\n"):
        j.write("   //ClassDef(Looper,0);\n") #if you find the bad ClassDef line, then write the commented out version
j.close()
