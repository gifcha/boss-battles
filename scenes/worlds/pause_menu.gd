extends Control

func _ready():
	$AnimationPlayer.play("RESET")

func resume():
	get_tree().paused = false
	$AnimationPlayer.play_backwards("fade")

func pause():
	get_tree().paused = true
	$AnimationPlayer.play("fade")

func testesc():
	if Input.is_action_just_pressed("pause") and !get_tree().paused:
		pause()
	elif Input.is_action_just_pressed("pause") and get_tree().paused:
		resume()

func _on_resume_pressed():
	if get_tree().paused:
		resume()

func _on_restart_pressed():
	if get_tree().paused:
		resume()
		get_tree().reload_current_scene()


func _on_menu_pressed():
	if get_tree().paused:
		resume()
		get_tree().change_scene_to_file("res://scenes/ui/gui_main_menu.tscn")

func _process(delta):
	testesc()

