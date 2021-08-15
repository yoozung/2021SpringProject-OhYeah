function getParameter(input) {
	input = input.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	let regex = new RegExp("[\\?&]" + input + "=([^&#]*)"),
		results = regex.exec(location.search);
	return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

document.querySelector("#waitRestaurantName").innerHTML = getParameter("shopName");
document.querySelector("#shopName").value = getParameter("shopName").trim();
document.querySelector("#shopNo").value = getParameter("shopNo");

