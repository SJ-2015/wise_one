window.onload = function(){
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

		//grabbing the name of the factors from the controller via data-attribute in div	  	
	var allFactorNames = $('#best-option').data('factornames');	
	var factorMaxScoreArray= $('#best-option').data('factormaxscore');
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

	var barChartData = {
			labels : allOptionNames,
			datasets : [
				{
					
					fillColor : "rgba(220,220,220,0.5)",
					strokeColor : "rgba(220,220,220,0.8)",
					highlightFill: "rgba(220,220,220,0.75)",
					highlightStroke: "rgba(220,220,220,1)",
					//first data in array correspond to first option: array of all the first metric
					// data array is [first option's first metric, second metric's first metric..]
					//send as json or nested arrays:
					//arraymaster of [ [all first metrics - all options], [all second metrics - all options], []]
					// this one is arraymaster[0]
					//iterator through factor_ids:
					// for each factor, iterator all options 
						//grab the option.metrics with the matching factor_id, put into one array
						//add this array to master array

					data : [100,20,30,40]
				},
				{
				
					fillColor : "rgba(151,187,205,0.5)",
					strokeColor : "rgba(151,187,205,0.8)",
					highlightFill : "rgba(151,187,205,0.75)",
					highlightStroke : "rgba(151,187,205,1)",
					data : [30,40,50,70]
				},
				{
				
					fillColor : "rgba(240,73,73,0.5)",
					strokeColor : "rgba(240,73,73,0.8)",
					highlightFill : "rgba(240,73,73,0.75)",
					highlightStroke : "rgba(240,73,73,1)",
					data : [200,40,50,70]
				}
			]
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
	