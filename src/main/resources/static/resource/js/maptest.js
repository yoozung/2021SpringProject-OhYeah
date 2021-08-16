 function openWaitList (event) { 
 	let shopInfo = event.target.parentElement.parentElement;
 	let shopName = shopInfo.querySelectorAll(".shopInfo")[0].innerHTML;
 	let shopNo = shopInfo.querySelectorAll(".shopInfo")[1].innerHTML;
 	// alert(shopName + ", " + shopNo);
 	
 	
 	
	let specs = "width=500, height=700, top=300, left=500 location=0";
	
	let win = window.open("/waitList/getLineForm?shopName="+shopName+"&shopNo="+shopNo, "_blank", specs);
}
