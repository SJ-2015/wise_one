window.onload = function(){

	var allFactorNames = $('#best-option').data('factornames');	
	var factorMaxScoreArray= $('#best-option').data('factormaxscore');

	//value pie
	var doughnutData = [
		{
			value: (!factorMaxScoreArray[0] ? 0 : factorMaxScoreArray[0]),
			color:"#F7464A",
			highlight: "#FF5A5E",
			label: (!allFactorNames[0] ? "" : allFactorNames[0])
		},
		{
			value: (!factorMaxScoreArray[1] ? 0 : factorMaxScoreArray[1]),
			color: "#46BFBD",
			highlight: "#5AD3D1",
			label: (!allFactorNames[1] ? "" : allFactorNames[1])
		},
		{
			value: (!factorMaxScoreArray[2] ? 0 : factorMaxScoreArray[2]),
			color: "#FDB45C",
			highlight: "#FFC870",
			label: (!allFactorNames[2] ? "" : allFactorNames[2])
		},
		{
			value: (!factorMaxScoreArray[3] ? 0 : factorMaxScoreArray[3]),
			color: "#949FB1",
			highlight: "#A8B3C5",
			label: (!allFactorNames[3] ? "" : allFactorNames[3])
		},
		{
			value: (!factorMaxScoreArray[4] ? 0 : factorMaxScoreArray[4]),
			color: "#4D5360",
			highlight: "#616774",
			label: (!allFactorNames[4] ? "" : allFactorNames[4])
		}
	];

		//grabbing the name of the factors from the controller via data-attribute in div	  	
	
	
	var winnerFactorScores= $('#best-option').data('winnerfactorscores');	

	var barHorizChartData = {
		  		labels : allFactorNames,

		  		//this data is for the score of the factors of this option
		  		datasets : [
		  			{
		  				fillColor : "rgba(151,187,205,0.5)",
		  				strokeColor : "rgba(151,187,205,0.8)",
		  				highlightFill : "rgba(151,187,205,0.75)",
		  				highlightStroke : "rgba(151,187,205,1)",
		  				data : winnerFactorScores
		  			},

		  			//this data is for the max_score of the factors
		  			{
		  				fillColor : "rgba(220,220,220,0.5)",
		  				strokeColor : "rgba(220,220,220,0.8)",
		  				highlightFill: "rgba(220,220,220,0.75)",
		  				highlightStroke: "rgba(220,220,220,1)",
		  				data : factorMaxScoreArray
		  			}
		  		]

		  	};

	//*** for all option stack chart ***//	  	
	//grabbing the name of the ranked options from the controller via data-attribute in div	  

	var allOptionNames = $('#all-options').data('optionnames');
	

	var allScoreStacked = $('#all-options').data('allscorestacked');

	var factorCount = allFactorNames.length;

	var allOptionStackData = [
				{
					fillColor : "#F7464A",
					strokeColor : "#F7464A",
					highlightFill: "#FF5A5E",
					highlightStroke: "#FF5A5E",
					data : allScoreStacked[0]
				},
				{
					fillColor : "#46BFBD",
					strokeColor : "#46BFBD",
					highlightFill : "#5AD3D1",
					highlightStroke : "#5AD3D1",
					data : allScoreStacked[1]
				},
				{
					fillColor : "#FDB45C",
					strokeColor : "#FDB45C",
					highlightFill : "#FFC870",
					highlightStroke : "#FFC870",
					//set defaultdata to for now
					data : allScoreStacked[2]
				},
				{
					fillColor : "#949FB1",
					strokeColor : "#949FB1",
					highlightFill : "#A8B3C5",
					highlightStroke : "#A8B3C5",
					//set defaultdata to for now
					data : allScoreStacked[3]
				},
				{
					fillColor : "#4D5360",
					strokeColor : "#4D5360",
					highlightFill : "#616774",
					highlightStroke : "#616774",
					//set defaultdata to for now
					data : allScoreStacked[4]
				}
			]

	var barChartData = {
			labels : allOptionNames,
			//dataset has default color, but color set beyond factor count is not used
			datasets : allOptionStackData.splice(0,factorCount)
		};
	

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
	