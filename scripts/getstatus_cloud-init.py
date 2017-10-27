import os,json,time,sys 

file = "/run/cloud-init/result.json"

while not os.path.exists(file):
  print("Cloud-init still running...")
  time.sleep(5)

ret = json.load(open(file, "r"))
if len(ret['v1']['errors']):
  print "Cloud-init finished with errors:" + "\n".join(ret['v1']['errors'])
  sys.exit(1)
else:
  print "Clour-init finished no errors"
