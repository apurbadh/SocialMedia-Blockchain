<script>
	import SocialMedia from "../build/SocialMedia.json"
	export default{
		methods : {
			async getData(){
				this.count = await this.BlockChain.methods.postCount().call()
				console.log(this.count)
			}
		},
		setup(props){
			const BlockChain = new window.web3.eth.Contract(SocialMedia.abi, SocialMedia.networks[5777].address)
			return {
				BlockChain
			}
		},
		data(){
			return {
				count : 1,
				posts : []
			}
		},
		mounted(){
			this.getData()
		}
	}
	
</script>
<template>
	<div>
		<h2 style="text-align: center;margin: 5rem;" v-if="count == 0">No Post Has Been Posted Yet</h2>
		<div class="card" style="margin-left: 10rem;margin-right: 10rem; margin-bottom : 1rem" v-for="post in posts">
			<div class="card-body">
				{{ post }}
			</div>
		</div>

	</div>

</template>