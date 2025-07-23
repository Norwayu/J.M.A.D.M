extends Control
@export var CloseButton:Button
var BotonUiMoviles:CheckButton
var MBool = BotonUiMoviles.button_pressed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	BotonUiMoviles = get_node("BoleanoBoton1")
	GameManager.SetMobileControls = MBool
	
	if CloseButton:
		CloseButton.pressed.connect(_CloseGui)
	if BotonUiMoviles:
		BotonUiMoviles.pressed.connect(_ToggledButton)
		

func _ToggledButton() -> void:
	GameManager.SetMobileControls = MBool

func _CloseGui() -> void:
	visible = !visible

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
