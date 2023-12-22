#!/bin/bash
MAX_DAYS=90

rm -rf .git
git init
cat  <<EOF > README.md
# Github Streak Vanity Pop

Want to make your GitHub streak metrics pop ?
Run `run.sh`
creates a commit for every day for the last $MAX_DAYS days.

## Commits for the last $MAX_DAYS

EOF
git add .
git commit --date "$date" -m "$message"

days=$(seq $MAX_DAYS | tac)
for day in $days ;
do 
    date="$day days ago"
    message="Vanity commited $date"
    echo "- Added vanity commit $message" >> README.md
    git add .
    git commit --date "$date" -m "$message"
done
git log --oneline | tac

cat <<EOF

# Create a new repository on Github and push your local repo....

git remote add origin https://github.com/Ephygtz/Github-streak-vanity-popper.git
git branch -M main
git push -u origin main
EOF