tmpfile=$(mktemp --suffix .md /tmp/pull_request.XXXXX)

base_ref=$(git branch --all --format="%(refname:short)" | fuzzel --dmenu --prompt="base ref: ")

git log --pretty=PR --reverse "$base_ref..HEAD" > $tmpfile

$EDITOR $tmpfile

read -p "Do you want to proceed? (y/n) " -n 1 -r yn
echo  # Move to a new line
case $yn in
    [Yy]* ) 
      echo "Proceeding..."
      gh pr edit -F $tmpfile
      ;;
    [Nn]* ) 
      echo "Exiting..." 
      ;;
    * ) echo "Please answer yes or no.";;
esac

rm "$tmpfile"

