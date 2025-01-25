extends Node

var enemy = load("res://enemyplaceholder.tscn")
var deeper = (["res://BACKGROUND11.png", "res://BACKGROUND21.png","res://BACKGROUND31.png","res://BACKGROUND41.png","res://BACKGROUND51.png"])
var background:Sprite2D
var t: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	background = get_node("Sprite2D")
	background.texture =load(deeper[0])

func SpawnObject():
	var init_pos = Vector2(576,648)
	var enemy_instance = enemy.instantiate()
	enemy_instance.position = init_pos
	if randi_range(1,1000) == 69:
		enemy_instance.type = 4
	elif  Global.speed < 2:
		enemy_instance.type = 0
	elif Global.speed == 2:
		enemy_instance.type = randi() % 2
		background.texture=load(deeper[1])
	elif Global.speed == 3:
		enemy_instance.type = randi_range(0,2)
		background.texture=load(deeper[2])
	elif Global.speed >= 4:
		enemy_instance.type = randi_range (0,3)
		background.texture=load(deeper[3])
	if Global.speed == 5:
		background.texture=load(deeper[4])
	add_child(enemy_instance)
	print("ola estoy spawneando")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_node("Label").text = "Followers: " + str(Global.points)
	get_node("Label2").text = "Speed: " + str(Global.speed)
	t += delta
	if t >= 1.0:
		t -= 1.0
		SpawnObject()
