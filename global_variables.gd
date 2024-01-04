extends Node
class_name Global


const UNIT_SIZE = 100 ## size of 1 unit in pixels


static var player : Player


static func getRootNode(node: Node): ## returns the root node of the given node
	var root = node.get_tree().current_scene
	return root

static func spawnScene(scene: PackedScene, parentNode: Node): ## spawns a node in the parent node and returns it
	var node = scene.instantiate()
	parentNode.add_child(node)
	return node

