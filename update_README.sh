echo "heroku: https://one-day-brandeis.herokuapp.com/" > README.md
echo "Please add \`# FIXME\` wherever you see something that needs fixing." >> README.md 
printf "Before pushing to master, run \`./update_README.sh\`.\n\n" >> README.md 
echo '==========FIXME==========' >> README.md 
rails notes:fixme >> README.md