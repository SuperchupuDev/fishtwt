extends Node

var enemy = load("res://enemyplaceholder.tscn")
var t: float = 0.0

func SpawnObject():
	var init_pos = Vector2(576,648)
	var enemy_instance = enemy.instantiate()
	enemy_instance.position = init_pos
	enemy_instance.type = randi() % 2
	add_child(enemy_instance)
	print("ola estoy spawneando")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_node("Label").text = "Followers: " + str(Global.points)
	get_node("Label2").text = "Speed: " + str(Global.speed)
	t += delta
	if t >= 1.0:
		t -= 1.0
		SpawnObject()
