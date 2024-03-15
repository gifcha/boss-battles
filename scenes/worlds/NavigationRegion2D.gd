extends NavigationRegion2D


func _ready():
	var map = get_world_2d().navigation_map
	print("region map: ", map)
	Navigation.create_region(navigation_polygon)
