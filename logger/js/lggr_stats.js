/* */

$(document).ready(function() {

Chart.defaults.global.responsive = true;
var options = {
	animateRotate: true
};


var ctx = $("#chartMsgsPerHour").get(0).getContext("2d");
new Chart(ctx).Bar(dataMsgsPerHour, options);

ctx = $("#chartServers").get(0).getContext("2d");
new Chart(ctx).Bar(dataServers, options);

ctx = $("#chartLevels").get(0).getContext("2d");
new Chart(ctx).PolarArea(dataLevels, {animateRotate: true, showScale: false});

ctx = $("#chartServersPie").get(0).getContext("2d");
new Chart(ctx).Doughnut(dataServersPie, options);

$('#cloudcontainer').jQCloud(dataCloudWords, {
	autoResize: true
});

});
