<template>
  <div class="rpi">
    <div style="padding: 25px;width:80%; margin: auto;" v-show="errors.length > 0">
      <div style="color:red">
        <div style="">
          <h1>Bad input data</h1>
          <p v-bind:key="i" v-for="(err, i) in errors">{{ err }}</p>
        </div>
        <div style="">
          <img src="data:images/png;base64,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">
        </div>
      </div>
    </div>
    <div style="text-align: left; padding-left: 25px; padding-right: 25px; width: 80%; margin: auto;"  v-show="!autoStart && !connected">
      <div style="padding:15px">
        <label for="video-secure" style="background: #eee">
          Secure Mode:
          <input id="video-secure" type="checkbox" v-model="secureMode" disabled>
        </label>
      </div>
      <div style="padding:15px">
        <label for="video-mode">
          Share Mode:
          <input id="video-mode" type="checkbox" v-model="shareMode" v-bind:disabled="loading || connected">
        </label>
      </div>
      <div style="padding:15px">
        <label for="ethereum-address">
          Ethereum Address / DNS:
          <input id="ethereum-address" type="text" v-model="address" placeholder="ethereum address / DNS" v-bind:disabled="loading || connected">
        </label>
      </div>
      <div style="padding:15px">
        <label for="port">
          Port:
          <input id="port" type="text" v-model="port" placeholder="port" v-bind:disabled="loading || connected">
        </label>
      </div>
      <div style="padding:15px">
        <label for="width">
          Width:
          <input id="width" type="text" v-model="width" placeholder="width" v-bind:disabled="loading || connected">
        </label>
      </div>
      <div style="padding:15px">
        <label for="height">
          Height:
          <input id="height" type="text" v-model="height" placeholder="height" v-bind:disabled="loading || connected">
        </label>
      </div>
    </div>
    <div style="text-align: left; padding-left: 25px; padding-right: 25px; width: 80%; margin: auto;"  v-show="!autoStart">
      <div style="padding:15px">
        <button v-on:click="startVideoStream" v-bind:disabled="loading || connected">Start</button>
        <button v-on:click="stopVideoStream" v-show="connected">Stop</button>
      </div>
    </div>
    <canvas id="video" v-show="connected"></canvas>
  </div>
</template>

<script>
export default {
  name: 'Rpi',
  data: function () {
    return {
      secureMode: true,
      shareMode: true,
      autoStart: true,
      // autoStart: false,
      address: /([^/\.]+)/.exec(window.location.hostname)[1],
      port: '3030',
      width: 320,
      height: 180,
      loading: false,
      connected: false,
      wsavc: {},
      errors: []
    }
  },
  mounted () {
    const route = this.$route
    const { shareMode, address, port, width, height, autoStart } = route.query
    if (typeof shareMode !== 'undefined') {
      this.shareMode = true
    }
    if (typeof address === 'string' && this.isValidAddress(address)) {
      this.address = address
    }
    if (typeof port === 'string' && this.isValidPort(port)) {
      this.port = port
    }
    if (typeof autoStart !== 'undefined') {
      this.autoStart = true
    }
    if (typeof width === 'string' && this.isValidWidth(width)) {
      this.width = width
    }
    if (typeof height === 'string' && this.isValidHeight(height)) {
      this.height = height
    }
    if (this.autoStart) {
      this.startVideoStream()
    }
  },
  beforeDestroy () {
    this.destroyPlayer()
  },
  methods: {
    isValidAddress (address) {
      if (/^[a-zA-Z0-9][a-zA-Z0-9-]{5,30}[a-zA-Z]$/.test(address)) {
        return true
      }
      if (/^(0x|0X)[0-9a-fA-F]{40}$/.test(address)) {
        return true
      }
      return false
    },
    isValidPort (port) {
      if (!/^[0-9]{1,5}$/.test(port)) {
        return false
      }
      if (parseInt(port) <= 0) {
        return false
      }
      return true
    },
    isValidWidth (width) {
      if (!/^[0-9]{1,4}$/.test(width)) {
        return false
      }
      if (parseInt(width) <= 0) {
        return false
      }
      return true
    },
    isValidHeight (height) {
      if (!/^[0-9]{1,4}$/.test(height)) {
        return false
      }
      if (parseInt(height) <= 0) {
        return false
      }
      return true
    },
    validateInput () {
      this.errors = []
      if (!this.isValidAddress(this.address)) {
        this.errors.push('Invalid diode address: "' + this.address + '"')
      }
      if (!this.isValidPort(this.port)) {
        this.errors.push('Wrong port')
      }
      if (!this.isValidWidth(this.width)) {
        this.errors.push('Wrong width')
      }
      if (!this.isValidHeight(this.height)) {
        this.errors.push('Wrong height')
      }
      let validated = this.errors.length <= 0
      return validated
    },
    startVideoStream (e) {
      if (!this.validateInput()) {
        return
      }
      if (this.connected) {
        this.destroyPlayer()
      }
      this.loading = true
      var WSAvcPlayer = window.WSAvcPlayer
      var canvas = document.getElementById('video')
      var wsavc = new WSAvcPlayer(canvas, 'webgl', true)
      var protocol = (this.secureMode) ? 'wss' : 'ws'
      var uri = (this.shareMode) ? `${protocol}://rs-${this.address}-${this.port}.diode.ws/` : `${protocol}://r-${this.address}-${this.port}.diode.ws/`
      var twoFrames = [
        0, 0, 0, 1, 39, 66, 128, 40, 149, 160, 80, 103, 231, 128, 120, 145, 53,
        0, 0, 0, 1, 40, 206, 1, 15, 32
      ]

      this.wsavc = wsavc
      this.wsavc.initCanvas(this.width, this.height)
      this.wsavc.pushRawVideo(twoFrames)
      this.wsavc.connect(uri, () =>{
          console.log("WSAvcPlayer: Connection closed")
          this.connected = false
      })
      this.loading = false
      this.connected = true
    },
    stopVideoStream (e) {
      this.destroyPlayer()
    },
    destroyPlayer () {
      if (this.wsavc.removeAllListeners !== undefined) {
        this.wsavc.removeAllListeners()
        this.wsavc.disconnect()
        this.wsavc = null
        this.connected = false
        window.player = null
      }
    }
  }
}
</script>
