$(document).ready(function(){ 
  $(document).ready(function () { 
    $("#effect").toggle(false); 
  }); 
 });
$(function() {
	//run the currently selected effect
	function runEffect(){
		//get effect type from 
		var selectedEffect = 'blind';
		
		//most effect types need no options passed by default
		var options = {};
		if(selectedEffect == 'scale'){ options = {percent: 0}; } 
		else if(selectedEffect == 'size'){ options = { to: {width: 200,height: 60} }; }
		//run the effect
		$("#effect").toggle(selectedEffect,options,300);
	};
	
	//set effect from select menu value
	$("#tree").click(function() {
		runEffect();
		return false;
	});

});