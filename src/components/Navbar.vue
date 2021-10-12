<script setup>
	defineProps({
		username: String
	})
</script>
<template>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="container-fluid">
  	<ul class="navbar-nav">
    	<router-link class="navbar-brand" to="/">BlockMedia</router-link>
    	<li class="nav-item">
    		<router-link class="nav-link" to="/create">Create Post</router-link>
    	</li>
    </ul>
  </div>
  <div class="d-flex">
  	<span style="color : whitesmoke;margin: 5px;">{{ username }}</span>
  </div>
</nav> 
</template>