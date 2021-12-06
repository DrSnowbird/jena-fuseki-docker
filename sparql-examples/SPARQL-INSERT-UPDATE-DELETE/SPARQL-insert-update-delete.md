#!/bin/bash -x

## -- ref: https://www.w3.org/Submission/SPARQL-Update/#sec_examples -- ##

curl 'http://0.0.0.0:13030/try-insert-delete/update' \
  -H 'Accept: text/plain,*/*;q=0.9' \
  -H 'Content-Type: application/x-www-form-urlencoded; charset=UTF-8' \
  --data-raw 'update=PREFIX+dc%3A+%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Felements%2F1.1%2F%3E%0AINSERT+DATA%0A%7B%0A++%3Chttp%3A%2F%2Fexample%2Fbook3%3E+dc%3Atitle++++%22A+new+book%22+%3B%0A+++++++++++++++++++++++++dc%3Acreator++%22A.N.Other%22+.%0A%7D' 

# -- response --
# <html>
# <head>
# </head>
# <body>
# <h1>Success</h1>
# <p>
# Update succeeded
# </p>
# </body>
# </html>

