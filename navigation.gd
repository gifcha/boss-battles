extends Node


var MAP : RID :
	get:
		return MAP
	set(m):
		MAP = m


func create_region(navPolygon : NavigationPolygon):
	if MAP == null:
		Debug.log("Navigation.create_region > MAP is null!")
		return
	var region = NavigationServer2D.region_create()
	NavigationServer2D.region_set_transform(region, Transform2D())
	NavigationServer2D.region_set_navigation_polygon(region, navPolygon)
	NavigationServer2D.region_set_map(region, MAP)

func request_path(origin, target):
	var path = []
	path = NavigationServer2D.map_get_path(MAP, origin, target, true, 1)
	return path


func _ready():
	pass

func _process(delta):
	pass
