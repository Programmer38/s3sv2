function check(){
	let internal = $("#select_internal").val();
	let outer = $("#select_outer").val();
	let door_knob = $("#select_door_knob").val();
	let direction = $("#select_direction").val();
	if (internal == 1) {
    	$(".pokraska").css("background", "yellow");
	} else if (internal == 2) {
		$(".pokraska").css("background", "green");
	} else if (internal == 3) {
		$(".pokraska").css("background", "blue");
	} else if (internal == 4) {
		$(".pokraska").css("background", "red");
	}
	if (outer == 1) {
    	$(".plenka").css("background", "yellow");
	} else if (outer == 2) {
		$(".plenka").css("background", "green");
	} else if (outer == 3) {
		$(".plenka").css("background", "blue");
	} else if (outer == 4) {
		$(".plenka").css("background", "red");
	}
	if (door_knob == 1) {
    	$(".ruchka").css("background", "yellow");
	} else if (door_knob == 2) {
		$(".ruchka").css("background", "green");
	} else if (door_knob == 3) {
		$(".ruchka").css("background", "blue");
	} else if (door_knob == 4) {
		$(".ruchka").css("background", "red");
	}
	if (direction == 1) {
    	$(".dveri").addClass("revers");
	} else if (door_knob == 2) {
		$(".dveri").removeClass("revers");
	}
};
$(document).ready(function() {
	$("#select_complect").change(function() {
		$("form select option:selected").prop("selected", false);
		let accessories = $(this).find("option:selected").attr("data_accessories");
		$("#select_internal").val($(this).find('option:selected').attr("data_painting"));
		$("#select_outer").val($(this).find("option:selected").attr("data_foil"));
		$("#select_door_knob").val($(this).find('option:selected').attr("data_door_hundle"));
		$("#select_width").val($(this).find("option:selected").attr("data_width"));
		$("#select_height").val($(this).find('option:selected').attr("data_height"));
		$("#select_direction").val($(this).find('option:selected').attr("data_opening"));


		check();
		var arr = accessories.split(";");
		$.each(arr, function (i, e) {
      	$("#select_accessories option[value='" + e + "']").prop("selected", true);
    	});
		let price = 0;
		$("form select option:selected").each(function (index) {
			price += Number($(this).attr("data_price"));

		});
		$(".price").text(price);
		$("input[name='price']").val(price);
		$("input[name='pdf_price']").val(price);
	});

	$('form select').change(function() {
		let price = 0;
		$("form select option:selected").each(function (index) {
			price += Number($(this).attr("data_price"));
			//console.log($(this).attr("data_price"));
		});
		$(".price").text(price);
		$("input[name='price']").val(price);

		/*let price = Number($(".price").text());
		price += Number($("option:selected", this).attr("data_price"));
		$(".price").text(price);
		$("input[name='price']").val(price);*/
	});


	$("#select_internal").change(function () {
		let back = $(this).val();
		//желтый, зеленый, синий красный
		if(back == 1){
			$(".pokraska").css("background","yellow");
		}
		else if(back == 2){
			$(".pokraska").css("background", "green");
		}
		else if(back == 3){
			$(".pokraska").css("background", "blue");
		}
		else if (back == 4) {
			$(".pokraska").css("background", "red");
   	}
	});
	$("#select_outer").change(function () {
		let back = $(this).val();
		if (back == 1) {
			$(".plenka").css("background", "yellow");
		} else if (back == 2) {
			$(".plenka").css("background", "green");
		} else if (back == 3) {
			$(".plenka").css("background", "blue");
		} else if (back == 4) {
			$(".plenka").css("background", "red");
		}
	});
	$("#select_door_knob").change(function () {
		let back = $(this).val();
		if (back == 1) {

		$(".ruchka").css("background", "yellow");
		} else if (back == 2) {
		$(".ruchka").css("background", "green");
		} else if (back == 3) {
		$(".ruchka").css("background", "blue");
		} else if (back == 4) {
		$(".ruchka").css("background", "red");
		}
	});
	$("#select_direction").change(function () {
    let positions = $(this).val();//21,22
		if(positions == 2){
			$(".dveri").addClass("revers");
		}
		if(positions == 1){
			$(".dveri").removeClass("revers");
		}
	});

});
