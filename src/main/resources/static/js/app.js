
//alert("hello");

async function getAJoke() {
    let response = await fetch("https://v2.jokeapi.dev/joke/Programming");
    let data = await response.json();

    title1.innerHTML = `
<p id="text" >${data.joke}</p>
`
}


async function getCatImage() {

    let response = await fetch("https://api.thecatapi.com/v1/images/search");
    let data = await response.json();

    title1.innerHTML = `
    <img src="${data[0].url}" alt="" srcset="">
    `
}
async function getDogImage() {

    let response = await fetch("https://dog.ceo/api/breeds/image/random");
    let data = await response.json();

    title1.innerHTML = `
    <img src="${data.message}" alt="" srcset="">
    `
}

async function getMapsImageSrc(location) {	
	const apiKeyResponse = await fetch("/apiKey");
	const apiKey = await apiKeyResponse.json();
	console.log(apiKey);
	
	const response = await fetch("https://maps.googleapis.com/maps/api/staticmap?center="+location+"&zoom=14&size=500x500&key="+apiKey[0]);
	
	let mapImg = document.getElementById("google-map");
	mapImg.src = response.url;
}