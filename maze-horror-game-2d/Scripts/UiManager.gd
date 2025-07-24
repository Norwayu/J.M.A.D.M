extends Control
@export var PlayButton:Button
@export var QuitButton:Button
@export var FogAppear:TextureRect
@export var SettingButton:Button

@export var MusicMenuMain:AudioStreamPlayer
@export var ClickSoundPlay:AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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
