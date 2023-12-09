extends Node2D
var cobra_load = preload("res://scenes/cobra.tscn")
var start = false
var player = ''
var centro  = Vector2.ZERO
var shot_centro =[344,163]
var random = RandomNumberGenerator.new()
var reload = true
#688,346
# Called when the node enters the scene tree for the first time.
func _ready():
	centro = $'.'.position
	seed(140820)
	random.randomize()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if start:
		see()
		pass

func spam_cobra(position_player,rotate):
	var numx = random.randi_range(0,1)
	var num2 = random.randi_range(0,1)
	var snake = cobra_load.instantiate()
	if numx >= 0:
		snake.position.y = position_player.y
		if num2 > 0:
			snake.position.x = centro.x - shot_centro[0]
		else:
			snake.position.x = centro.x + shot_centro[0]
			snake.scale.x =  -1
			
	else:		
		snake.position.x = position_player.x #
		if num2 >= 0:		
			snake.position.y = centro.y  + shot_centro[1]
			snake.scale.y = 1
		else:
			snake.position.y = centro.y - shot_centro[1]
			snake.scale.y = -1
			
	
	get_parent().add_child(snake)

func see():
	if player == null:
		return
	var localizacao = player.position
	if !reload:
		spam_cobra(localizacao,[0,1])
		$'Area2D/CollisionShape2D/Timer'.start(0)
		reload = true
	pass

func _on_area_2d_body_entered(body):
	get_tree().change_scene_to_file('res://scenes/imagem_naufraga.tscn')	
	if !start:
		player = body
		start = true
	pass # Replace with function body.


func _on_timer_timeout():
	reload = false
	pass # Replace with function body.
