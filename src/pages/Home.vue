<script>
	import SocialMedia from "../build/SocialMedia.json"
	export default{
		methods : {
			async getData(){
				let post;
				this.count = await this.BlockChain.methods.postCount().call()
				for (let i = 1; i <= this.count; i++)
				{	
					post = await this.BlockChain.methods.posts(i).call();
					this.posts.push(post)
				}
			},
			async tipUser(id){

				this.BlockChain.methods.tipPost(id).send({from : web3.eth.accounts.givenProvider.selectedAddress, value: window.web3.utils.toWei('0.001', 'Ether')})
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
		

<div class="card" style="margin: 5rem" v-for="post in posts">
  <div class="card-header">
    {{ post.creator }}
  </div>
  <div class="card-body">
    <h5 class="card-title">{{ post.content }} </h5>
 	<br>
 	<button class="btn btn-primary" @click="() => tipUser(post.id)">Tip Creator 0.001 ETH</button>
  </div>
</div>	
	</div>

</template>
<style type="text/css">
	a{
		text-decoration: none;
		color:  black;
	}
</style>