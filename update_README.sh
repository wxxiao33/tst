printf "heroku: https://one-day-brandeis.herokuapp.com/\n\n" > README.md
printf "Please add \`# FIXME\` wherever you see something that needs fixing.\n\n" >> README.md 
printf "Before pushing to master, run \`./update_README.sh\`.\n\n" >> README.md 
printf '==========FIXME==========\n' >> README.md 
rails notes:fixme >> README.md