
/* 전체 선택 */
function checkAll() {
	var emailElement = document.selectForm.email;
	
	for (index = 0; index < emailElement.length; index++) {
		if (emailElement[index].checked == false) {
			emailElement[index].click();
		}
	}
}

/* 전체 해제 */
function clearAll() {
	var emailElement = document.selectForm.email;
	
	for (index = 0; index < emailElement.length; index++) {
		if (emailElement[index].checked) {
			emailElement[index].click();
		}
	}
}

