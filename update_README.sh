printf "heroku: https://one-day-brandeis.herokuapp.com/\n" > README.md
printf "Please add \`# FIXME\` wherever you see something that needs fixing.\n" >> README.md 
printf "Before pushing to master, run \`./update_README.sh\`.\n\n" >> README.md 
printf '==========FIXME==========' >> README.md 
rails notes:fixme >> README.md