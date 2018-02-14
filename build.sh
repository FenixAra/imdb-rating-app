#!/usr/bin/env bash


export APP_NAME="IMDB-Rating"
export PORT=3000
export AUTH_TOKEN="6D7U6Xh2uRRUxcVRPeSGNfxmVT4tepxuMVC5vLkL2LtLBrDBstrz2qbKuHtZVsPM"

go install
if [ $? != 0 ]; then
  echo "## Build Failed ##"
  exit
fi


echo "Doing some cleaning ..."
go clean
echo "Done."

echo "Running goimport ..."
goimports -w=true .
echo "Done."

echo "Running go format ..."
gofmt -w .
echo "Done."

echo "Running go build ..."
go build -race
if [ $? != 0 ]; then
  echo "## Build Failed ##"
  exit
fi
echo "Done."

echo "Running unit test ..."
go test -p=1 ./services/... ./utils/...
if [ $? == 0 ]; then
    echo "Done."
	echo "## Starting service ##"
    ./imdb-rating-app
fi
