git init
git remote add origin https://github.com/devHybrid0306/driver_app.git
Y=2019
M=04
D=11
i=4
export GIT_COMMITTER_DATE="$Y-$M-$D 12:0$i:00"
export GIT_AUTHOR_DATE="$Y-$M-$D 12:0$i:00"
git add .
git commit -m 'initial commit'
git push -u origin master