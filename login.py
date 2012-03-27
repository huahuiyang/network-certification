def BuptLogin():
  import httplib2
  import urllib            
  import hashlib

  ###your username and password###
  username = '08211578'
  pwd = 'huahui********'  
  ###your username and password###

  urlstr = "http://10.3.8.150/cgi-bin/do_login"

  m = hashlib.md5(pwd.encode("gb2312"))
  passwordMd5 = m.hexdigest()[8:24]

  data={'username':username,'password':passwordMd5,'drop':0,'type':1,'n':100}
  h = httplib2.Http('.cache')
  response,content = h.request(urlstr, 'POST', urllib.parse.urlencode(data), headers={'Content-Type': 'application/x-www-form-urlencoded'})
  print(content.decode('utf-8'))

BuptLogin()
