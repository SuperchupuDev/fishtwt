extends RigidBody2D

@export var type: int
var sprite:Sprite2D
var label:Label
var sprites=["res://fishpfp01.png","res://baitpfp1.png","res://botpfp1.png","res://dolphinpfp1.png","res://blahajpfp1.png"]
var messages=[
	["Mamawebe digo glugluglu",
	"I love the sea :()",
	"Alguien quiere entradas para Fishnet?",
	"Feliseadades a mi prima Lola en su transición a Blahaj!!!!",
	"Hook TUAH",
	"Qué buen anzuelo he encontrado! Espero que nada malo pase",
	"just learned about air. what the crab",
	"me estoy pescando",
	"YUMMMMM SO FULL OF MICROPLASTIC",
	"nueva en esta ciudad, qué me recomiendan?",
	"he comprado peztrógenos en temu",
	"Fact: ningún personaje de la pecera tiene sexualidad canónica, excepto gamba que es lesbiana y lleva leyendo Yuri desde segundo de la PEZO antes d irse a dormir religiosamente aunque jamas se lo a comentado a nadie porque le da muchísima vergüenza admitir q lo hace",
	"who up eating they food",
	"Tienes que ir a terapia, tienes que ir a terapia y no hablar con tus peces cercanos sobre nada complicado",
	"pezzy wezzy uwu"],
	["KRILL YOURSELF!!!!!!!\"!!!¿¿\"!!!!!\"",
	"FISH YOU",
	"zero likes, impressive",
	"dijiste esto hace siete años. qué tienes que decir al respecto",
	"gills in bio opinion discarded",
	"have u seen this",
	"go breathe some air",
	"podrías espaciar tus periodos de respirar un poco más? es que es la semana de finales :()",
	"look!! a bubbol :O",
	"it's not true, but the fact that it couñd have been really says a lot..heh",
	"salmorejo = gazpacho con pan",
	"javasfish es un buen lenguaje",
	"interpreta :(){ :|:& };:",
	"google en crabbant",
	"is it really planar though",
	"go with the flow"],
		["ace1","ace2"],
	["JOHN DEATH WILL FIX THIS. SHUTR UP",
	"wahh wahh <- this is you",
	"the flood is coming. the flood is coming. the flood is",
	"I AGREE AND THINK YOU SHOULD BECOME GOD",
	"IM NOT SURE AND THINK YOU SHOULD DIE REGARDLESS",
	"I DISAGREE AND THINK YOU SHOULD TURN INTO very nice bait for others to eat, actually",
	"i'm not owned!! (turns into a corncob)",
	"im kubus",
	"chatpez said otherwise, therefore i must be right!!",
	"Interesting",
	"Concerning",
	"I definitely don't do pezamine and I am a responsible leader",
	"imagínate que tienes dos gambas",
	"i must embrace the black mold",
	"there is only one fish"],
	["bla1","bla2"]
	]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	sprite = get_node("Sprite2D2")
	sprite.texture=load(sprites[type])
	label = get_node("Label")
	label.text = messages[type][randi() % messages[type].size()]

func _on_visible_on_screen_notifier_2d_screen_exited():
	if Global.points > 0:
		if type == 0 or type == 4:
			Global.points -= 1
		elif type == 1:
			Global.points += 5
		elif type == 2:
			Global.points -=5
		elif type == 3:
			Global.points -=1
	print("i died")
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	linear_velocity = Vector2(0, -108) * Global.speed

func _input_event(_viewport, event: InputEvent, _shape_idx):
	if  event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var old_points = Global.points
		if type == 0 or type == 4:
			Global.points += 1
		elif Global.points > 0:
			if type == 1:
				Global.points -=5
			elif type == 2:
				Global.points -=10
		elif type == 3:
			Global.point +=1
		if old_points < 10 and Global.points >= 10:
			Global.speed = 2
		elif old_points < 30 and Global.points >= 30:
			Global.speed = 3
		elif old_points < 70 and Global.points >=70:
			Global.speed = 4
		elif old_points < 100 and Global.points >=100:
			Global.speed = 5
		print("clicked");
		queue_free()
	elif event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_RIGHT:
		if type == 2:
			Global.points +=5
		elif Global.points > 0:
			Global.points -= 1
