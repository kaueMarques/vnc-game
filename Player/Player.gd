extends Area2D

var speed:float = 150
var vel := Vector2(0, 0)
var plBullet := preload("res://Bullet/bullet1.tscn") 


onready var Gun := $Gun
onready var shotDelayTimer := $shotDelayTimer
var player = AudioStreamPlayer.new()

onready var shotDelay : float = 0.1
var dirVec := Vector2(0,0)

func actionPlayerRight():
	dirVec.x = -1
	
func actionPlayerLeft():
	dirVec.x = +1

func actionPlayerShot():
		for child in Gun.get_children():
			var bullet1 := plBullet.instance()
			bullet1.global_position = child.global_position
			get_tree().current_scene.add_child(bullet1)

func _process(delta):
	
	if Input.is_action_pressed("shoot") and shotDelayTimer.is_stopped(): 
		shotDelayTimer.start(shotDelay)
		
		for child in Gun.get_children():
			var bullet1 := plBullet.instance()
			bullet1.global_position = child.global_position
			get_tree().current_scene.add_child(bullet1)

func _physics_process(delta):
	
	if Input.is_action_pressed("move_left"):
		dirVec.x = -1
		shotDelay = 0.4
				
	elif Input.is_action_pressed("move_right"):
		dirVec.x = +1
		shotDelay = 0.4
		
	vel = dirVec.normalized() * speed
	position += vel * delta
	
	var viewRect := get_viewport_rect()
	position.x = clamp(position.x, 0, viewRect.size.x)
	position.y = clamp(position.y, 0, viewRect.size.y)

func _on_Player_area_entered(area):
	get_tree().change_scene("res://mainScenes/Gameplay.tscn")

func _on_btnLeft_pressed():
	actionPlayerLeft()

func _on_btnRight_pressed():
	actionPlayerRight()

func _on_btnShot_pressed():
	actionPlayerShot()

	
