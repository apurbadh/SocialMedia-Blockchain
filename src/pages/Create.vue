<script>
	export default {
		data(){
			return {
				user_input : ""
			}
		},
		methods : {
			createPost(){
				console.log(this.user_input)
			}
		}
	}
</script>

<template>
	<h2 style="text-align: center; margin: 2rem;">Create Post</h2>

	<div style="display: flex; justify-content: center;">
		<input type="text" class="form-control" style="width: 40%;" placeholder="Write something" v-model="user_input">
		<button class="btn btn-primary" @click="createPost">Create Post</button>
	</div>
</template>