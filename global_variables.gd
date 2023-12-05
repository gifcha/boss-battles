extends Node
class_name Global


const UNIT_SIZE = 100 ## size of 1 unit in pixels

static func getRootNode(node: Node): ## returns the root node (usually world) of the given node
	var world = node.get_tree().current_scene
	return world

static func spawnNode(node: Node, parentNode: Node): ## spawns a node in the parent node and returns it
	var newNode = node.new()
	parentNode.add_child(newNode)
	return newNode
