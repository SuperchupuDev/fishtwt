extends RigidBody2D

@export var type: int

var speech_element = load("res://speech.tscn")

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
	["\"John Geometry\", inventor of geometry, has confirmed a new shape: the squagindle. It's rumored to look like this",
	"Hello I Am A Wildlife Photographer And This Is A Picture I Captured Today ❤️",
	"Check out free iptv at fttp://hot-fishes.com/iptv",
	"All over the world, extremely hot rodchains 4 new crypto coin",
	"Soy reclutador en Tasty Plankton Reviews. Me gustaría ofrecerte un trabajo online que puedes hacer en cualquier momento y desde cualquier lugar",
	"Mr. Fishamine has announced his new crypto giveaway. Go to flon dot com",
	"Breaking: Intact Body of Big-Headed Alien Found Inside Egyptian Pyramid, Dating Back 2,000,000 Years  \"Details below in the comments section... 📷📷",
	"⚡ #FISHTO PUMP Season 4. Enter below to join 🪂",
	"I love mr fishamine. I love his boots and i wish i could lick them every day. also krill yourself for disagreeing with him",
	"Wow, what place are you buying your medicine from? It is very important to know",
	"I also had a hacked account and @GIVE_ME_YOUR_MONER helped and fixed my life. would recommendr",
	"Los drones lagartija cuchilla han sido expandidos por todo el mundo y se asegurarán que la neurotoxina se expanda. Disfruten de las siguientes 24 horas",
	"El auricular que los mayores de 65 buscan. No te creerás cómo funciona!",
	"Padre embarazado iba a abortar y rezó 15 veces antes de entrar en la clínica. Lo que pasó después te conmoverá",
	"Now on Amazon: $ BATAMANTA $ 20% Off",
	"I’m sorry, but I cannot fulfill this request as it goes against OpenCRP use policy"],
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

var sfx = [
	["res://sfx/normal1.wav","res://sfx/normal2.wav"],
	["res://sfx/bait1.wav","res://sfx/bait2.wav"],
	["res://sfx/normal1.wav","res://sfx/normal1.wav"],
	["res://sfx/angry1.wav","res://sfx/angry2.wav"],
	["res://sfx/normal1.wav","res://sfx/normal2.wav"]
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite = get_node("Sprite2D2")
	sprite.texture=load(sprites[type])
	label = get_node("Label")
	label.text = messages[type][randi() % messages[type].size()]
	$AudioStreamPlayer.stream = load(sfx[type][randi() % sfx[type].size()])
	$AudioStreamPlayer.pitch_scale = randf_range(0.5, 2.5)
	$AudioStreamPlayer.play()

func _on_visible_on_screen_notifier_2d_screen_exited():
	if type == 0 or type == 4:
		remove_points(1)
	elif type == 2:
		remove_points(5)
	elif type == 3:
		remove_points(1)
	update_speed()
	print("i died")
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	linear_velocity = Vector2(0, -108) * Global.speed

func speech(element_type: int):
	var speech_instance = speech_element.instantiate()
	speech_instance.position = Vector2(position.x + randf_range(-150, 150), position.y)
	speech_instance.type = element_type
	get_parent().add_child(speech_instance)

func _input_event(_viewport, event: InputEvent, _shape_idx):
	if  event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if type == 0 or type == 4:
			add_points(1)
		elif type == 1:
			remove_points(5)
		elif type == 2:
			remove_points(10)
		elif type == 3:
			add_points(1)
		update_speed()
		speech(0);
		print("clicked");
		queue_free()
	elif event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_RIGHT:
		if type == 2:
			add_points(5)
		else:
			remove_points(1)
		update_speed()
		speech(1);
		print("blocked")
		queue_free()

func add_points(points: int):
	Global.points += points

func remove_points(points: int):
	if Global.points > points:
		Global.points -= points
	else:
		Global.points = 0

func update_speed():
	if Global.points >= 100:
		Global.speed = 5
	elif Global.points >= 70:
		Global.speed = 4
	elif Global.points >= 30:
		Global.speed = 3
	elif Global.points >= 10:
		Global.speed = 2
	else:
		Global.speed = 1
