extends Area2D

func _ready():
	pass


func _on_EndScreen_area_entered(area):
		get_tree().change_scene("res://mainScenes/Gameplay.tscn")
