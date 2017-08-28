
# Change file path of the git repo. 
# Add ABC as prefix: code will become ABC/code 
# see https://stackoverflow.com/questions/614229/can-i-move-the-git-directory-for-a-repo-to-its-parent-directory/614254
git filter-branch --index-filter \
    'git ls-files -s | sed "s=\t=&ABC/=" |
     GIT_INDEX_FILE=$GIT_INDEX_FILE.new \
     git update-index --index-info &&
     mv $GIT_INDEX_FILE.new $GIT_INDEX_FILE' HEAD

