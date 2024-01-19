<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="style.css2">
</head>

<body>
	<!-- select 1 -->
	<div class="select">
		<div class="selected">
			<div class="selected-value">종목</div>
			<div class="arrow"></div>
		</div>
		<ul>
			<li class="option">option 1</li>
			<li class="option">option 2</li>
			<li class="option">option 3</li>
		</ul>
	</div>

	<!-- select 2 -->
	<div class="select">
		<div class="selected">
			<div class="selected-value">월</div>
			<div class="arrow"></div>
		</div>
		<ul>
			<li class="option">option 1</li>
			<li class="option">option 2</li>
			<li class="option">option 3</li>
		</ul>
	</div>

	<script>
		const selectBoxElements = document.querySelectorAll(".select");

		function toggleSelectBox(selectBox) {
			selectBox.classList.toggle("active");
		}

		function selectOption(optionElement) {
			const selectBox = optionElement.closest(".select");
			const selectedElement = selectBox.querySelector(".selected-value");
			selectedElement.textContent = optionElement.textContent;
		}

		selectBoxElements.forEach(selectBoxElement => {
			selectBoxElement.addEventListener("click", function (e) {
				const targetElement = e.target;
				const isOptionElement = targetElement.classList.contains("option");

				if (isOptionElement) {
					selectOption(targetElement);
				}

				toggleSelectBox(selectBoxElement);
			});
		});

		document.addEventListener("click", function (e) {
			const targetElement = e.target;
			const isSelect = targetElement.classList.contains("select") || targetElement.closest(".select");

			if (isSelect) {
				return;
			}

			const allSelectBoxElements = document.querySelectorAll(".select");

			allSelectBoxElements.forEach(boxElement => {
				boxElement.classList.remove("active");
			});
		});
	</script>
</body>

</html>