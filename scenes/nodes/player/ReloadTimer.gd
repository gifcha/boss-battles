extends TextureProgressBar

var timer = Timer.new()

func playAnimation(reloadTime : float):
	print("timer started", " ", reloadTime)
	max_value = reloadTime
	value = reloadTime
	step = reloadTime / 100
	timer.start(reloadTime)
	visible = true

func _ready():
	timer.autostart = true
	timer.one_shot = true
	add_child(timer)
	SignalController.connect("reloading", playAnimation)

func _process(delta):
	value = timer.time_left
	if value == 0:
		visible = false
