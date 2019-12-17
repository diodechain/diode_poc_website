# Diode-POC Web3 PiCam 

Diode Proof-Of-Concept Web3 PiCam to stream video from raspberry pi raw h264 video through the Diode Web3 Network.

# Concept

On this website, we use websockets to stream the binary data through the Diode gateway: wss://[mode]-[address]-[port].diode.ws. When you connect to the gateway, the gateway will use a Kademlia network lookup to identify the device in the network. If the device is connected anywhere to the network, you can reach the device from any other point through the Diode network. The gateway that you can also run locally to be totally decentralized is [here](https://github.com/diodechain/diode_go_client).

> Note:
>
> Due to a limitation in the used wasm library, the video ratio can only be 16:9 or 4:3.

# Installation (draft)

To install this on your Raspberry Pi follow these steps.

## Setting up your PiCam

First ensure that your camera is activated and works: https://projects.raspberrypi.org/en/projects/getting-started-with-picamera/3

Then install the webserver:

```bash
sudo apt install apache2
sudo chown pi:pi -R /var/www/html
```

And the diode client:

```bash
git clone https://github.com/diodechain/diode_go_client
cd diode_go_client
go build
./diode_go_client --fleet 0xYOURFLEET --runproxy=false runsocks=false
```

And start your camera:

```bash
raspivid -t 0 -w 400 -h 300 -fps 12 -n -l -o tcp://127.0.0.1:3030 -pf baseline -rot 90 2>&1
```

## Preparing the html

```
npm install
npm run build
rsync -vzr --delete dist/ YOURPI:/var/www/html/
```

# Development

``` bash
# install dependencies
npm install

# serve with hot reload at localhost:8080
npm run dev

# build for production with minification
npm run build

# build for production and view the bundle analyzer report
npm run build --report

# run unit tests
npm run unit

# run e2e tests
npm run e2e

# run all tests
npm test
```
