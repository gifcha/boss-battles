extends Node2D
class_name InputModule



static func getMovementInputDirection():
	var direction = Vector2()
	direction.x = Input.get_axis("action_left", "action_right")
	direction.y = Input.get_axis("action_up", "action_down")
	return direction


