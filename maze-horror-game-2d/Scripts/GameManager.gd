extends Node
var Scene
var ReadyPort:bool
var PlrMovement:bool = true
var Jumpscared
var Rng = RandomNumberGenerator.new()
var SetMobileControls:bool
var UiManager:CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ReadyPort = true
	Jumpscared = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Scene = get_tree().current_scene
	
func Jumpscare():
	Rng.randomize()
	var Duration = Rng.randf_range(0.25,2.5)
	if UiControl and not Jumpscared:
		PlrMovement = false
		Jumpscared = true
		await UiControl.ScreenJumpscare(Duration)
		get_tree().reload_current_scene()
		PlrMovement = true
		Jumpscared = false
		
func NextScene():
	if Scene.name == "Level1" and ReadyPort:
		ReadyPort = false
		get_tree().change_scene_to_file("res://Scenes/Levels/level_2.tscn")
	elif Scene.name == "Level2" and ReadyPort:
		ReadyPort = false
		get_tree().change_scene_to_file("res://Scenes/Levels/level_3.tscn")
	elif Scene.name == "Level3" and ReadyPort:
		ReadyPort = false
		get_tree().change_scene_to_file("res://Scenes/Levels/level_4.tscn")
	elif Scene.name == "MainMenu":
		get_tree().change_scene_to_file("res://Scenes/Levels/level_1.tscn")
