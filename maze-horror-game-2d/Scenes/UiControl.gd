extends CanvasLayer
@export var Jumpscare:TextureRect

@export var PngImagesJumpscares:Array[Texture2D]

@onready var MobileUi : Control = get_node("UiMain/MobileUi")

var Rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if MobileUi:
		MobileUi.visible = false
	if Jumpscare:
		Jumpscare.texture = PngImagesJumpscares[0]
		Jumpscare.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if MobileUi:
		MobileUi.visible = GameManager.SetMobileControls

func ScreenJumpscare(Duration):
	
	Rng.randomize()
	var Sound = $UiMain/JumpscareImage/JumpscareSound
	var JumpscareImage = PngImagesJumpscares[Rng.randi_range(0,PngImagesJumpscares.size() - 1)]
	Jumpscare.texture = JumpscareImage
	Jumpscare.visible = true
	if Sound: Sound.play()
	await get_tree().create_timer(Duration).timeout
	if Sound: Sound.stop()
	Jumpscare.texture = null
	Jumpscare.visible = false
