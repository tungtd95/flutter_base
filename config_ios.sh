set -x

env="dev"

if [ "$1" == "prod" ]
then
env="prod"
fi

ios/Pods/Natrium/bin/natrium -e $env -c Release -t Runner
