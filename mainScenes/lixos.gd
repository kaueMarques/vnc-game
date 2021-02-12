extends Node2D 

var randomNumber = RandomNumberGenerator.new()

func _ready():
	
	for child in $lixos:
		var sprits = ["res://Textures/bottle.png", "res://Textures/enemyUFO.png"]
	
		var numberOfSprit = randomNumber.randi_range(  0,  1)
	
		print(numberOfSprit)

		var chosedSprit = sprits[numberOfSprit]

		var texture = ImageTexture.new()
		var image = Image.new()
		image.load(chosedSprit)

		texture.create_from_image(image)
		$Sprite.texture = texture
	pass 
