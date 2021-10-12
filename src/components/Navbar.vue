<script setup>
	defineProps({
		username: String
	})
</script>
<template>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <div class="container-fluid">
  	<ul class="navbar-nav">
    	<a class="navbar-brand" href="/">BlockMedia</a>
    	<li class="nav-item">
    		<a class="nav-link" href="#post">Create Post</a>
    	</li>
    </ul>
  </div>
  <div class="d-flex">
  	<span style="color : whitesmoke;margin: 5px;">{{ username }}</span>
  </div>
</nav> 
</template>