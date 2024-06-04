extends Node2D

@onready var boss = get_parent()

@export var distToPlayer = 75

func getPosAroundPlayer():
	var pos = Global.player.global_position
	var direction = (pos - boss.global_position).normalized()
	var vec = direction * distToPlayer
	vec = vec.rotated(randf_range(0, 2))
	pos += vec
	
	var physPoint = PhysicsPointQueryParameters2D.new()
	physPoint.position = pos
	var intersections = get_world_2d().direct_space_state.intersect_point(physPoint, 1)
	
	# ja iegūtā punktā jau ir kāds ķermenis aprēķināt citu punktu
	if intersections.size() == 0:
		return pos
	else:
		getPosAroundPlayer()
	
	

func teleport():
	boss.global_position = getPosAroundPlayer()
