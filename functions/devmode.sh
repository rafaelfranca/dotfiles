function devmode ()
{
  echo
  echo "===================================================================="
  echo
  echo "      dP                                                dP          "
  echo "      88                                                88          "
  echo ".d888b88 .d8888b. dP   .dP    88d8b.d8b. .d8888b. .d888b88 .d8888b. "
  echo "88'  \`88 88ooood8 88   d8'    88'\`88'\`88 88'  \`88 88'  \`88 88ooood8 "
  echo "88.  .88 88.  ... 88 .88'     88  88  88 88.  .88 88.  .88 88.  ... "
  echo "\`88888P8 \`88888P' 8888P'      dP  dP  dP \`88888P' \`88888P8 \`88888P' "
  echo
  echo "===================================================================="
  echo

  echo "Welcome to the dev mode. Now you are a super star and can create amazing things!"

  if [[ ! $PATH =~ .*\./b.* ]]
  then
    export PATH="./b:$PATH"
  fi
}
