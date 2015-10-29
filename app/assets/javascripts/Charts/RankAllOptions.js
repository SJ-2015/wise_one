var doughnutData = [
	{
		value: 300,
		color:"#F7464A",
		highlight: "#FF5A5E",
		label: "Red"
	},
	{
		value: 50,
		color: "#46BFBD",
		highlight: "#5AD3D1",
		label: "Green"
	},
	{
		value: 100,
		color: "#FDB45C",
		highlight: "#FFC870",
		label: "Yellow"
	},
	{
		value: 40,
		color: "#949FB1",
		highlight: "#A8B3C5",
		label: "Grey"
	},
	{
		value: 120,
		color: "#4D5360",
		highlight: "#616774",
		label: "Dark Grey"
	}
];

var barHorizChartData = {
	  		labels : ["January","February","March","April","May","June","July"],
	  		datasets : [
	  			{
	  				fillColor : "rgba(220,220,220,0.5)",
	  				strokeColor : "rgba(220,220,220,0.8)",
	  				highlightFill: "rgba(220,220,220,0.75)",
	  				highlightStroke: "rgba(220,220,220,1)",
	  				data : [10,20,30,40,50,60,70]
	  			},
	  			{
	  				fillColor : "rgba(151,187,205,0.5)",
	  				strokeColor : "rgba(151,187,205,0.8)",
	  				highlightFill : "rgba(151,187,205,0.75)",
	  				highlightStroke : "rgba(151,187,205,1)",
	  				data : [10,20,30,40,50,60,70]
	  			}
	  		]

	  	};

var barChartData = {
		labels : ["Option1","Option1","Option1","Option1","Option1","Option1","Option1"],
		datasets : [
			{
				
				fillColor : "rgba(220,220,220,0.5)",
				strokeColor : "rgba(220,220,220,0.8)",
				highlightFill: "rgba(220,220,220,0.75)",
				highlightStroke: "rgba(220,220,220,1)",
				data : [10,20,30,40,50,60,70]
			},
			{
			
				fillColor : "rgba(151,187,205,0.5)",
				strokeColor : "rgba(151,187,205,0.8)",
				highlightFill : "rgba(151,187,205,0.75)",
				highlightStroke : "rgba(151,187,205,1)",
				data : [30,40,50,70,18,70,80]
			},
			{
			
				fillColor : "rgba(240,73,73,0.5)",
				strokeColor : "rgba(240,73,73,0.8)",
				highlightFill : "rgba(240,73,73,0.75)",
				highlightStroke : "rgba(240,73,73,1)",
				data : [30,40,50,70,18,70,80]
			}
		]
	};





	window.onload = function(){
	

		var ctxa = document.getElementById("value-pie").getContext("2d");
		window.myDoughnut = new Chart(ctxa).Doughnut(doughnutData, {responsive : true});

		var ctxb = document.getElementById("canvas-best-option").getContext("2d");
	    var chart = new Chart(ctxb).HorizontalBar(barHorizChartData, {
	  			responsive: true,
	        barShowStroke: false
	  		});

		var ctx = document.getElementById("canvas-all-options").getContext("2d");
		window.myBar = new Chart(ctx).StackedBar(barChartData, {
			responsive : true
		});

	};
	