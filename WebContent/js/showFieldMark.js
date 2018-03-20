function showField() {
	w = document.getElementById("select");
	x = document.getElementById("select1");
	y = document.getElementById("select2");

	if (w.value == "Modify") {
		x.style.display = "block";
	} else if (w.value == "Add") {
		x.style.display = "none";
	}
	
	if (w.value == "Modify" || w.value == "Delete") {
		y.style.display = "block";
	} else if (w.value == "Add") {
		y.style.display = "none";
	}
}