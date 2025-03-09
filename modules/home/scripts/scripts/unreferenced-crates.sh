if [ -z "$1" ]
then
  echo "Need at least two arguments, the first being a path to a crate"
  exit 1
fi

if [ -z "${@:2}" ]
then
  echo "Need at least one dependency name after the crate's path"
  exit 1
fi

for crate in ${@:2}
do
lib=$(echo $crate | sed "s/-/_/g")
rg -q "$lib::" $1 || echo "$crate"
done
