<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<style type="text/css">
		body, html,#allmap {width: 100%;height: 100%;overflow: 

hidden;margin:0;font-family:"微软雅黑";}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?
v=2.0&ak=km6iat7VGBHdGU1T8KmfwPgwwkmAuBMs"></script>
	<title>浏览器定位</title>
</head>
<body>
	<div id="allmap"></div>
</body>
</html>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");
//	var point = new BMap.Point(116.331398,39.897445);
//	map.centerAndZoom(point,12);
	var geolocation = new BMap.Geolocation();
	
	geolocation.getCurrentPosition(function(r){
		if(this.getStatus() == BMAP_STATUS_SUCCESS){
			var p = new BMap.Point(r.point.lng,r.point.lat);
			map.centerAndZoom(r.point,12);
			var mk = new BMap.Marker(r.point);
			map.addOverlay(mk);
			map.panTo(r.point);
			//alert('您的位置：'+r.point.lng+','+r.point.lat);
		}
		else {
			alert('failed'+this.getStatus());
		}        
	},{enableHighAccuracy: true})
	      
	//单击获取点击的经纬度
	map.addEventListener("click",function(e){
		  map.clearOverlays(); 
		  var mk = new BMap.Marker(e.point);
		  map.addOverlay(mk);
		  map.panTo(e.point);
	});
	map.addEventListener("dblclick",function(e){
		alert("双击事件");
	});
</script>