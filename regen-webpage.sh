#! /bin/bash

echo '<html>' > index.html
echo '<head>' >> index.html
echo '<title>My Anime Stats</title>' >> index.html
echo '<link rel="stylesheet" type="text/css" href="index.css">' >> index.html
echo '</head>' >> index.html
echo '<body>' >> index.html
echo '<div class = "title">' >> index.html
echo '<h1>[kiefciman ~]|||||||||||||</h1>' >> index.html
echo '<h2>My anime stats</h2><br>' >> index.html
echo '</div>' >> index.html
echo '<div class = "content">'>> index.html
echo '<div class = "container">' >> index.html
echo '<div class = "watching">' >> index.html
count_watching=$(cat animes.txt | cut -d'|' -f2 | grep w | wc -l)
echo "<h2>Watching $count_watching</h2>" >> index.html
awk -F'|' '$2~/^w/' animes.txt | awk -F'|' '{print "<div class = \"anime\"><h3>"$1"</h3>season "$4"/"$3" ep "$6"/"$5" "$7"★ </div>"}' >> index.html
echo '</div>' >> index.html
echo '<div class = "completed">' >> index.html
count_completed=$(cat animes.txt | cut -d'|' -f2 | grep c | wc -l)
echo "<h2>Completed $count_completed</h2>" >> index.html
awk -F'|' '$2~/^c/' animes.txt | awk -F'|' '{print "<div class = \"anime\"><h3>"$1"</h3>season "$4"/"$3" ep "$6"/"$5" "$7"★ </div>"}' >> index.html
echo '</div>' >> index.html
echo '<div class = "dropped">' >> index.html
count_dropped=$(cat animes.txt | cut -d'|' -f2 | grep d | wc -l)
echo "<h2>Dropped $count_dropped</h2>" >> index.html
awk -F'|' '$2~/^d/' animes.txt | awk -F'|' '{print "<div class = \"anime\"><h3>"$1"</h3>season "$4"/"$3" ep "$6"/"$5" "$7"★ </div>"}' >> index.html
echo '</div>' >> index.html
echo '<div class = "on_hold">' >> index.html
count_on_hold=$(cat animes.txt | cut -d'|' -f2 | grep h | wc -l)
echo "<h2>On hold $count_on_hold</h2>" >> index.html
awk -F'|' '$2~/^h/' animes.txt | awk -F'|' '{print "<div class = \"anime\"><h3>"$1"</h3>season "$4"/"$3" ep "$6"/"$5" "$7"★ </div>"}' >> index.html
echo '</div>' >> index.html
echo '<div class = "plan_to_watch">' >> index.html
count_plan_to_watch=$(cat animes.txt | cut -d'|' -f2 | grep p | wc -l)
echo "<h2>Plan to watch $count_plan_to_watch</h2>" >> index.html
awk -F'|' '$2~/^p/' animes.txt | awk -F'|' '{print "<div class = \"anime\"><h3>"$1"</h3>season "$4"/"$3" ep "$6"/"$5" "$7"★ </div>"}' >> index.html
echo '</div>' >> index.html
echo '</div>' >> index.html
echo '</body>' >> index.html
echo '</html>' >> index.html
