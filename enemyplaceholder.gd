extends RigidBody2D

@export var type: int
var sprite:Sprite2D
var label:Label
var sprites=["res://fishpfp1.png","res://baitpfp1.png"]
var messages=[["pan1","pan2"],["tran1","tran2"]]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	sprite = get_node("Sprite2D2")
	sprite.texture=load(sprites[type])
	label = get_node("Label")
	label.text = messages[type][randi() % 2]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _input_event(_viewport, event: InputEvent, _shape_idx):
	if  event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var old_points = Global.points
		if type == 0:
			Global.points += 1
		else:
			Global.points += 5
		if old_points < 10 and Global.points >= 10:
			Global.speed += 1
		elif old_points < 30 and Global.points >= 30:
			Global.speed += 1
		print("clicked");
		queue_free()
