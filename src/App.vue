<script setup>
// This starter template is using Vue 3 <script setup> SFCs
// Check out https://v3.vuejs.org/api/sfc-script-setup.html#sfc-script-setup
import Navbar from "./components/Navbar.vue"
import { onMounted } from "vue";
import Web3 from 'web3/dist/web3.min.js'

onMounted(()=> {
  if (window.web3)
  {
    window.web3 = new Web3(window.ethereum)
    window.ethereum.enable()
  }else{
    alert("Please install MetaMask")
  }
})
</script>
<script>
  export default{
    data(){
      return {
        username : window.ethereum ? window.ethereum.selectedAddress : "Not Connected"
      }
    }
  }
</script>
<template>
  <Navbar :username="username"/>
  <router-view></router-view>
</template>

