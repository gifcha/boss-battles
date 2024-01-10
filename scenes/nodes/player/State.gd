extends Node

var state = {
	idle=false,
	running=false,
	rolling=false
}



func noState(): # return true if all states are set to false
	var flag = true
	for key in state: 
		flag = -state[key] # opposite of value
	return flag



func _ready():
	pass


func _process(delta):
	if noState():
		state.idle = true
