extends Node
var Scene
var ReadyPort:bool
var PlrMovement:bool = true
var Jumpscared
var Rng = RandomNumberGenerator.new()
var SetMobileControls:bool

@onready var UiManager = get_tree().get_current_scene().get_node("GetUi/UiControl")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ReadyPort = true
	Jumpscared = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var Ui : Control = UiManager.get_node("MobileUi")
	Scene = get_tree().current_scene
	if Ui: Ui.visible = SetMobileControls
	
func Jumpscare():
	if UiManager and not Jumpscared:
		PlrMovement = false
		Jumpscared = true
		UiManager.ScreenJumpscare()
		await get_tree().create_timer(Rng.randf_range(0.25,2.5)).timeout
		get_tree().reload_current_scene()
		PlrMovement = true
		Jumpscared = false
		
func NextScene():
	if Scene.name == "Level1" and ReadyPort:
		ReadyPort = false
		get_tree().change_scene_to_file("res://Scenes/Levels/level_2.tscn")
	elif Scene.name == "MainMenu":
		get_tree().change_scene_to_file("res://Scenes/Levels/level_1.tscn")
