extends RigidBody2D

@export var type: int

var imgs = [
	[
		"res://speechbubble1.png",
		"res://speechbubble2.png",
		"res://speechbubble3.png",
		"res://speechbubble4.png",
		"res://speechbubble5.png",
		"res://speechbubble6.png",
		"res://speechbubble7.png",
		"res://speechbubble8.png",
		"res://speechbubble9.png",
		"res://speechbubble10.png"
	],
	["res://blockbubble1.png"]]
var snds = ["res://sfx/blocked.wav","res://sfx/blocked.wav"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Sprite2D.texture = load(imgs[type][randi() % imgs[type].size()])
	$AudioStreamPlayer.stream = load(snds[type])
	$AudioStreamPlayer.pitch_scale = randf_range(0.6, 1.2)
	$AudioStreamPlayer.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	linear_velocity = Vector2(0, -108) * Global.speed

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
