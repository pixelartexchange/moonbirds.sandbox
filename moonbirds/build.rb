
##
# 8 attribute(s):
# -  Body  10000  (17 uniques)
# -  Feathers  10000  (18 uniques)
# -  Beak  9976  (3 uniques)
# -  Eyes  8720  (11 uniques)
# -  Eyewear  1800  (12 uniques)
# -  Headwear  7041  (37 uniques)
# -  Outerwear  1689  (8 uniques)
# -  Background  10000  (10 uniques)


def metadata_columns   ## rename to metadata_schema or such - why? why not?
  [
   ['body',      { null: false }],
   ['feathers',  { null: false }],
   ['beak' ],
   ['eyes' ],
   ['eyewear' ],
   ['headwear' ],
   ['outerwear' ],
   ['background',  { null: false }],
  ]
end

