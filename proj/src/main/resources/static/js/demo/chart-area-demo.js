// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

/*function number_format(number, decimals, dec_point, thousands_sep) {
  // *     example: number_format(1234.56, 2, ',', ' ');
  // *     return: '1 234,56'
  number = (number + '').replace(',', '').replace(' ', '');
  var n = !isFinite(+number) ? 0 : +number,
    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
    s = '',
    toFixedFix = function(n, prec) {
      var k = Math.pow(10, prec);
      return '' + Math.round(n * k) / k;
    };
  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
  if (s[0].length > 3) {
    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
  }
  if ((s[1] || '').length < prec) {
    s[1] = s[1] || '';
    s[1] += new Array(prec - s[1].length + 1).join('0');
  }
  return s.join(dec);
}

// Area Chart Example
var ctx = document.getElementById("myAreaChart");
var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
    datasets: [{
      label: "Earnings",
      lineTension: 0.3,
      backgroundColor: "rgba(78, 115, 223, 0.05)",
      borderColor: "rgba(78, 115, 223, 1)",
      pointRadius: 3,
      pointBackgroundColor: "rgba(78, 115, 223, 1)",
      pointBorderColor: "rgba(78, 115, 223, 1)",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
      pointHitRadius: 10,
      pointBorderWidth: 2,
      data: [0, 10000, 5000, 15000, 10000, 20000, 15000, 25000, 20000, 30000, 25000, 40000],
    }],
  },
  options: {
    maintainAspectRatio: false,
    layout: {
      padding: {
        left: 10,
        right: 25,
        top: 25,
        bottom: 0
      }
    },
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false,
          drawBorder: false
        },
        ticks: {
          maxTicksLimit: 7
        }
      }],
      yAxes: [{
        ticks: {
          maxTicksLimit: 5,
          padding: 10,
          // Include a dollar sign in the ticks
          callback: function(value, index, values) {
            return '$' + number_format(value);
          }
        },
        gridLines: {
          color: "rgb(234, 236, 244)",
          zeroLineColor: "rgb(234, 236, 244)",
          drawBorder: false,
          borderDash: [2],
          zeroLineBorderDash: [2]
        }
      }],
    },
    legend: {
      display: false
    },
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      titleMarginBottom: 10,
      titleFontColor: '#6e707e',
      titleFontSize: 14,
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      intersect: false,
      mode: 'index',
      caretPadding: 10,
      callbacks: {
        label: function(tooltipItem, chart) {
          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
          return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
        }
      }
    }
  }
});*/

// Extracting data from Thymeleaf model attribute
		var originalData = /*[[${data}]]*/[];
		var data = originalData.slice(); // Create a copy to preserve original data

		// Function to convert date strings to JavaScript Date objects
		function convertDates(data) {
			return data.map(function (row) {
				// Assuming your_label_column_name is the column containing date in 'YYYYMMDD' format
				var dateString = row['date'];

				// Extracting year, month, and day from the string
				var year = parseInt(dateString.substring(0, 4), 10);
				var month = parseInt(dateString.substring(4, 6), 10) - 1; // Month is 0-based in JavaScript Date
				var day = parseInt(dateString.substring(6, 8), 10) + 1;
				
				

				// Creating a JavaScript Date object
				row['date'] = new Date(year, month, day);
				return row;
			});
		}

		// Function to update the chart based on date range
		function updateChart() {
			var startDateString = document.getElementById("startDate").value;
			var endDateString = document.getElementById("endDate").value;
			// Log the selected date range to the console
			console.log("Start Date:", startDateString);
			console.log("End Date:", endDateString);

			var startDate = new Date(startDateString);
			var endDate = new Date(endDateString);

			// Filter data within the specified date range
			data = originalData.filter(function (row) {
				// Assuming your_label_column_name is the column containing date in 'YYYYMMDD' format
				var date = row['date'];


				if (!(date instanceof Date)) {
					parseInt(row['date'].substring(0, 4), 10),
						parseInt(row['date'].substring(4, 6), 10) - 1,
						parseInt(row['date'].substring(6, 8), 10)

					row['date'] = new Date(year, month, day);
				}

				return date >= startDate && date <= endDate;
			});

			// Sort data in ascending order by date
			data.sort(function (a, b) {
				return a['date'] - b['date'];
			});
			if (window.myChart) {
				window.myChart.destroy();
			}
			// Update the chart
			updateChartWithData();
		}

		// Function to extract labels and values and draw the chart
		function updateChartWithData() {
			var labels = data.map(function (row) {
				// Format date as 'YYYY-MM-DD'
				return row['date'].toISOString().split('T')[0];
			});

			var values = data.map(function (row) {
				return row['cnt'];
			});

			// Drawing a line chart using Chart.js
			var ctx = document.getElementById('myChart').getContext('2d');
			// Destroy existing chart if it exists

			window.myChart = new Chart(ctx, {
				type: 'line',
				data: {
					labels: labels,
					datasets: [{
						label: 'Your Chart Label',
						data: values,
						borderWidth: 1
					}]
				},
				options: {

					// Add your chart options here
				}
			});
		}

		// Initial chart drawing
		data = convertDates(data);
		data.sort(function (a, b) {
			return a['date'] - b['date'];
		});
		updateChartWithData();
