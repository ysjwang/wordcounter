# Word Counter

Word Counter is a simple word-count on steroids. It lets you analyze chunks of text and see the frequency of words. Includes support for custom ignore groups (such as pronouns, preopositions, common words, etc). A demo version is running on heroku here: [Word Counter](http://wordcounter.herokuapp.com/).

## Custom Ignore Groups and Sample Text
You can modify or add your own custom ignore groups by changing up the [db/seeds.rb](https://github.com/ysjwang/wordcounter/blob/master/db/seeds.rb) file. Pretty simple stuff, looks like this:

	IgnoreGroup.create(title: "Pronouns",     words: "he,she,it,they,them,him,her,me,i")
	IgnoreGroup.create(title: "Posessives",   words: "his,her,hers,my,mine,our,ours,their,theirs")
	IgnoreGroup.create(title: "Articles",     words: "a,an,the")
	IgnoreGroup.create(title: "Prepositions", words: "aboard,about,above,across,after,against,along,amid,among,anti,around,as,at,before,behind,below,beneath,beside,besides,between,beyond,but,by,concerning,considering,despite,down,during,except,excepting,excluding,following,for,from,in,inside,into,like,minus,near,of,off,on,onto,opposite,outside,over,past,per,plus,regarding,round,save,since,than,through,to,toward,towards,under,underneath,unlike,until,up,upon,versus,via,with,within,without")

You'll also see reference to the "Obama SOTU" address that is included as sample chunk of text to analyze. The simple text file resides in `public/`; to add in your own sample text files, just drop the file in there, and following the similar syntax in the `db/seeds.rb` file.


## Usage
Developed on Rails 3.2.13 and Ruby 1.9.3. Uses PostgreSQL instead of SQLite (for Heroku deployment purposes).
