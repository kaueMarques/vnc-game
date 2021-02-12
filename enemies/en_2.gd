extends Area2D

export var minSpeed: float = 50
export var maxSpeed: float = 100

export var life: int = 1

var speed: float = 0.0



func _ready():
	speed = rand_range(minSpeed, maxSpeed)
	
func _physics_process(delta):
	position.y += speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free();
	
func damage(amount: int):
	life = life - amount
	if life < 1:
		queue_free()


