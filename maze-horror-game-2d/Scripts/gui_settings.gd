extends Control
@export var CloseButton:Button
var BotonUiMoviles:CheckButton
var MBool:bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	BotonUiMoviles = get_node("BoleanoBoton1")
	GameManager.SetMobileControls = MBool
	
	if CloseButton:
		CloseButton.pressed.connect(_CloseGui)
	

func _CloseGui() -> void:
	visible = !visible

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	MBool = BotonUiMoviles.button_pressed
	GameManager.SetMobileControls = MBool
