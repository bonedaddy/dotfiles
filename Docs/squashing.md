# squashing stuff

run the following command to start the rebase
`git rebase -i HEAD~N` where `N` is the number of commits to squash

Then in vim run the following to replace commits to squash, where `x` is the start line and `y` is the end line.
`x,ys/pick/squash/g`
