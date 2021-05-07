//hide alert
$(document).ready(function() {

	$("#alertSuccess").hide();
	$("#alertError").hide();
	$("#hidProjectIDSave").val("");
	$("#PROJECT")[0].reset();
});

$(document).on("click", "#save_project", function(event) {
	
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
	
	// Form validation-------------------
	var status = validateItemForm();
	if (status != true) {
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}
	
	var type = ($("#hidProjectIDSave").val() == "") ? "POST" : "PUT";
	
	$.ajax({
		url : "ProjectAPI",
		type : type,
		data : $("#Project").serialize(),
		dataType : "text",
		complete : function(response, status) {
			onItemSaveComplete(response.responseText, status);
		}
	});
	
});

function validateItemForm() {

	if ($("#project_category").val().trim() == "Select Project Category") {
		return "Select Project Category.";
	}

	if ($("#project_name").val().trim() == "") {
		return "Enter Project name.";
	}

	if ($("#short_des").val().trim() == "") {
		return "Enter Short Description.";
	}

	if ($("#price").val().trim() == "") {
		return "Enter Price.";
	}

	if ($("#date").val().trim() == "") {
		return "Enter Date.";
	}

	if ($("#long_des").val() == "") {
		return "Enter Long Description.";
	}

	if ($("#project_goal").val().trim() == "") {
		return "Enter Project Goal.";
	}
	
	if ($("#long_des").val().trim()  == "") {
		return "Enter Long Description.";
	}
	return true;
}