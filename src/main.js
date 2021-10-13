import "bootstrap/dist/css/bootstrap.min.css"
import "bootstrap"
import { createApp } from 'vue'
import { createRouter, createWebHistory } from "vue-router"
import App from './App.vue'
import Home from "./pages/Home.vue"
import Create from "./pages/Create.vue"
import Post from "./pages/Post.vue"

const router = createRouter({
	history: createWebHistory(),
	routes: [
		{ path : "/", name : "Home", component: Home },
		{ path : "/create", name : "Create", component: Create },
		{ path : "/post/:id", name : "Post", component: Post }
	]
})

createApp(App)
.use(router)
.mount('#app')
