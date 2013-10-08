# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

IgnoreGroup.create(title: "Pronouns",     words: "he,she,it,they,them,him,her,me,i")
IgnoreGroup.create(title: "Posessives",   words: "his,her,hers,my,mine,our,ours,their,theirs")
IgnoreGroup.create(title: "Articles",     words: "a,an,the")
IgnoreGroup.create(title: "Prepositions", words: "aboard,about,above,across,after,against,along,amid,among,anti,around,as,at,before,behind,below,beneath,beside,besides,between,beyond,but,by,concerning,considering,despite,down,during,except,excepting,excluding,following,for,from,in,inside,into,like,minus,near,of,off,on,onto,opposite,outside,over,past,per,plus,regarding,round,save,since,than,through,to,toward,towards,under,underneath,unlike,until,up,upon,versus,via,with,within,without")


obama_sotu = File.read("public/Obama_SOTU.txt")

Document.create(title: "Obama's State of the Union Address", content: obama_sotu)