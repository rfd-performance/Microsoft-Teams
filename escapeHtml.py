import sys
# Escape certain characters within html to be element in a json field
# /
# "
# '
#
print(sys.argv[1].replace('/','\/').replace('"','\\"').replace("'",""))
