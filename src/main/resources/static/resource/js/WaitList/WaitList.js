function getParameter(input) {
	input = input.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	let regex = new RegExp("[\\?&]" + input + "=([^&#]*)"),
		results = regex.exec(location.search);
	return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

function randomNum() {
	let output = "";
	for(let i = 0; i < 5; i++) {
		output += String(Math.round(Math.random()*9));
	}
	return output;
}
// let waitNo = "";
// let temp0 = getParameter("shopName");

let waitNo = randomNum();

document.querySelector("#waitRestaurantName").innerHTML = getParameter("shopName");
document.querySelector("#shopName").value = getParameter("shopName").trim();
document.querySelector("#shopNo").value = getParameter("shopNo");
document.querySelector("#waitNo").value = waitNo;

const $cancleBtn = document.querySelector("#cancleBtn");

$cancleBtn.addEventListener("click", ()=> {
	window.close();
});
