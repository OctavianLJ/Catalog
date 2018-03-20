function showField() {
	w = document.getElementById("select");
	x = document.getElementById("select1");
	y = document.getElementById("select2");
	z = document.getElementById("select3");
	if (w.value == "Add") {
		x.style.display = "block";
	} else if (w.value == "Delete") {
		x.style.display = "none";
	}
	if (y.value == "Teacher") {
		z.style.display = "block";
	} else if (y.value == "Student") {
		z.style.display = "none";
	}
	
}