if [[ -z "${BW_SESSION}" ]]; then
  . bw-unlock
fi

echo $(bw get password $1) | pass insert -e -f $1
