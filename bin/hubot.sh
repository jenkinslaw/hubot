#!/bin/bash
# Synopsis:
# hubot [<command>]

command=''

setSourceDirhubotry()
{
  scriptPath=$(which $0)

  if [ -L $scriptPath ]; then
    DIR=$(dirname $(readlink -f $scriptPath))
  else
    DIR=$(dirname $scriptPath)
  fi
}

# Help.
synopsis()
{
  echo ''
  echo 'Synopsis:'
  echo '---------'
  echo 'hubot --help        Show this synopsis.'
  echo 'hubot               Run self tests using casperjs.'
  echo 'hubot [<command>]   The basic signature for the hubot command.'
  echo ''
  echo  Example:
  echo '---------'
  echo 'hubot mail           Prints copy of the deploy ment notifcation to stdout.'
  echo ''
  echo ''
}


setSourceDirhubotry

# At least one argument must be passed to to hubot.
if [ $# -lt 1 ]
then
  echo "You must provided a command argument."
  synopsis
  exit 64
fi

# View the help.
if [ $1 = '--help' -o $1 = '-h' -o $1 = '-help' ]
then
  synopsis
  exit 64
fi


# Set up for generating View tests.
if [ $1 = 'mail' ]
then
  command='print_deploy_email'
fi


# Run tests or genrate some tests.
if [ $1 = "selftest" ]
then
  rake -f $DIR/../Rakefile
else
  rake -f $DIR/../Rakefile $command
fi

