<script setup>
	defineProps({
		username: String
	})
</script>
<script>
  export default{
    data(){
      inCreate : this.$route.path == "/create"
    },
    methods: {
      clicked(){
        console.log()
      }
    }
  }
</script>
<template>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="container-fluid">
  	<ul class="navbar-nav">
    	<router-link class="navbar-brand" to="/">BlockMedia</router-link>
    	<li class="nav-item">
        <router-link class="nav-link active" to="/create" v-if="inCreate">Create Post</router-link>
    		<router-link class="nav-link" to="/create" v-else>Create Post</router-link>
    	</li>
    </ul>
  </div>
  <div class="d-flex">
  	<span style="color : whitesmoke;margin: 5px;">{{ username }}</span>
  </div>
</nav> 
</template>