extends Area2D

export var minSpeed: float = 50
export var maxSpeed: float = 100
var randomNumber = RandomNumberGenerator.new()
export var life: int = 1

var speed: float = 0.0
var trhead = Thread.new()

func _ready():

	speed = rand_range(minSpeed, maxSpeed)
	_thread_function(start_sprit())

	
func _physics_process(delta):
	position.y += speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free();
	
func damage(amount: int):
	life = life - amount
	if life < 1:
		queue_free()
		
func start_sprit():

	var sprits = ["res://Textures/bottle.png", "res://Textures/enemyUFO.png"]
	
	var numberOfSprit = randomNumber.randi_range(  0,  1)
	
	print(numberOfSprit)


func _thread_function(userdata):
	start_sprit()
	pass
