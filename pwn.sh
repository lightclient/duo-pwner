#! /bin/bash

URL=$1

# ensure the correct number of arguments were passed in
if [ $# -eq 0 ]; then
  echo "Incorrect number of arguments. Please try again."
  echo "Usage: ./start.sh \"{Duo activation link}\""
  echo
  exit 1
fi

# check that it is a URL
regex='(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'
if [[ ! $URL =~ $regex ]]; then
  echo "Invalid URL. Please ensure you are using the link provided to you by Duo."
  exit 1
fi

# ensure that docker is install on client
if ! type "docker" >/dev/null 2>/dev/null; then
  echo "Docker is required to pwn Duo. Please install it to continue."
  echo "https://docs.docker.com/install/"
  echo
  exit 1
fi

# stop old containers
docker stop duo-bypass >/dev/null 2>/dev/null
docker rm duo-bypass >/dev/null 2>/dev/null


# run container
echo "Loading Docker image"
docker run --privileged -d -p 5555:5555 -p 6080:6080 -e DEVICE="Samsung Galaxy S6" -e DUO_URL="$URL" --name duo-bypass mattgarnett/duo-pwner #>/dev/null 2>/dev/null

# sleep for 75 seconds while we wait for the system to boot up
echo "Booting up VM"
for i in {1..10}
do
  sleep 3
  echo -n ". "
  sleep 2
done

echo

# run script
docker exec -d duo-bypass /root/run.sh

echo "pwning . . . ( tune into 0.0.0.0:6080 for the show )"
for i in {1..5}
do
  sleep 3
  echo -n ". "
  sleep 2
done

echo

echo "pwn'd"
