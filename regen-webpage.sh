#! /bin/bash

echo '<html>' > index.html
echo '<head>' >> index.html
echo '<title>My Anime Stats</title>' >> index.html
echo '<link rel="stylesheet" type="text/css" href="index.css">' >> index.html
echo '</head>' >> index.html
echo '<body>' >> index.html
echo '<div class = "title">' >> index.html
echo '<h1>[kiefciman ~]|||||||||||||</h1>' >> index.html
echo '</div>' >> index.html
echo '<div class = "content">'>> index.html
echo '<div class = "container">' >> index.html
echo '<div class = "watching">' >> index.html
echo '<h2>Watching</h2>' >> index.html
awk -F'|' '$2~/^w/' animes.txt | awk -F'|' '{print "<div class = \"anime\"><h3>"$1"</h3>"$3"/"$4" "$5"★ </div>"}' >> index.html
echo '</div>' >> index.html
echo '<div class = "completed">' >> index.html
echo '<h2>Completed</h2>' >> index.html
awk -F'|' '$2~/^c/' animes.txt | awk -F'|' '{print "<div class = \"anime\"><h3>"$1"</h3>"$3"/"$4" "$5"★ </div>"}' >> index.html
echo '</div>' >> index.html
echo '<div class = "dropped">' >> index.html
echo '<h2>Dropped</h2>' >> index.html
awk -F'|' '$2~/^d/' animes.txt | awk -F'|' '{print "<div class = \"anime\"><h3>"$1"</h3>"$3"/"$4" "$5"★ </div>"}' >> index.html
echo '</div>' >> index.html
echo '<div class = "on_hold">' >> index.html
echo '<h2>On hold</h2>' >> index.html
awk -F'|' '$2~/^h/' animes.txt | awk -F'|' '{print "<div class = \"anime\"><h3>"$1"</h3>"$3"/"$4" "$5"★ </div>"}' >> index.html
echo '</div>' >> index.html
echo '<div class = "plan_to_watch">' >> index.html
echo '<h2>Plan to watch</h2>' >> index.html
awk -F'|' '$2~/^p/' animes.txt | awk -F'|' '{print "<div class = \"anime\"><h3>"$1"</h3>"$3"/"$4" "$5"★ </div>"}' >> index.html
echo '</div>' >> index.html
echo '</div>' >> index.html
echo '</body>' >> index.html
echo '</html>' >> index.html
