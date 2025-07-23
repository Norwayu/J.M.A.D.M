extends Control
@export var PlayButton:Button
@export var QuitButton:Button
@export var FogAppear:TextureRect
@export var SettingButton:Button

@export var MusicMenuMain:AudioStreamPlayer
@export var ClickSoundPlay:AudioStreamPlayer

@export var Jumpscare:TextureRect

@export var PngImagesJumpscares:Array[Texture2D]

@onready var MobileUi = get_node("MobileUi")

var Rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	if Jumpscare:
		Jumpscare.texture = PngImagesJumpscares[3]
		Jumpscare.visible = false
	
	if MusicMenuMain:
		MusicMenuMain.play()
		
	if PlayButton and FogAppear:
		FogAppear.visible = false
		PlayButton.pressed.connect(_ClickButton)
		
	if SettingButton:
		SettingButton.pressed.connect(_OpenConfig)
		
func _ClickButton():
	MusicMenuMain.stop()
	if ClickSoundPlay: ClickSoundPlay.play()
	print(FogAppear.modulate)
	FogAppear.modulate = Color(0,0,0,1)
	FogAppear.visible = true
	for i in range(0,300,1):
		await get_tree().create_timer(0.01).timeout
		var Value1 = (i / 150.0)
		FogAppear.modulate = Color(0,0,0,Value1)
		print(FogAppear.modulate)
	GameManager.NextScene()

func _OpenConfig() -> void:
	var Gui : Control = get_node("GuiSettings")
	Gui.visible = !Gui.visible

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func ScreenJumpscare():
	Rng.randomize()
	var Sound = $JumpscareImage/JumpscareSound
	var JumpscareImage = PngImagesJumpscares[Rng.randi_range(0,PngImagesJumpscares.size() - 1)]
	Jumpscare.texture = JumpscareImage
	Jumpscare.visible = true
	if Sound:
		Sound.play()
	
