<script>
	import { onMount } from 'svelte';

	const url = 'http://localhost:4000/example';
	let res;

	function getData() {
		fetch(url)
            .then(response=>response.json())
			.then((data) => {
                console.log(data);
				res = data.msg;
			})
			.catch((err) => {
				console.log('Something went wrong', err);
			});
	}

	onMount(async () => {
		getData();
	});
</script>

<h1>Welcome to SvelteKit</h1>
<p>Visit <a href="https://kit.svelte.dev">kit.svelte.dev</a> to read the documentation</p>

<p>{res}</p>
