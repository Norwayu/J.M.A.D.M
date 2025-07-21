extends Node
var Scene
var ReadyPort

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ReadyPort = true
	Scene = get_tree().current_scene

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func NextScene():
	print(Scene.name)
	if Scene.name == "Level1" and ReadyPort:
		ReadyPort = false
		get_tree().change_scene_to_file("res://Scenes/level_2.tscn")
