<script>
	import SocialMedia from "../build/SocialMedia.json"

	export default {
		setup(props){
			const BlockChain = new window.web3.eth.Contract(SocialMedia.abi, SocialMedia.networks[5777].address)
			return {
				BlockChain
			}

		},
		data(){
			return {
				user_input : ""
			}
		},
		methods : {
			async createPost(){
				if (!this.user_input || this.user_input.length < 5){
					alert("Very less characters !")
					return
				}
				this.user_input = await this.BlockChain.methods.createPost(this.user_input).send({from : web3.eth.accounts.givenProvider.selectedAddress})
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