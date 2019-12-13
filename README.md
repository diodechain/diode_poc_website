# diode-poc-website

Diode proof of concept website to stream video from raspberry pi raw h264 video through diode network.

# concept

In diode poc website, we use websocket to streaming binary data from our diode gateway: wss://[mode]-[address]-[port].diode.ws. When you connect to the gateway, gateway will look for the device address in our diode servers. If the device is connected, you can reach the device through diode network. Check the source code of gateway [here](https://github.com/diodechain/diode_go_client).

> Note:
>
> Due to Broadway wasm limitation, the video ratio should be 16:9 or 4:3, make sure before start streaming.

# development

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
