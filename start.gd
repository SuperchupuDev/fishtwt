extends RigidBody2D

var manager: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.visible = false

var game = load("res://main.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
var ended = false
func _process(_delta: float) -> void:
	if !ended and Global.points >= 130:
		ended = true
		linear_velocity = Vector2.ZERO
		position = Vector2.ZERO
		$AnimatedSprite2D.position = Vector2(576,324)
		$Sprite2D.visible = false
		print("HI i DIED")
		$AnimatedSprite2D.play()
		$AnimatedSprite2D.visible = true
		manager.queue_free()
	elif ended:
		position = Vector2.ZERO
		$Sprite2D.position = Vector2(576,324)

var started = false
func _input_event(_viewport, event: InputEvent, _shape_idx):
	if !started and event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		started = true
		var game_instance = game.instantiate()
		print("start")
		manager = game_instance
		add_sibling(manager)
