var velocidade= 350 
var salto = 30 
var move_teste =false
var direction = 1
var solo = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move(delta)
	pass

func move(delta):
	move_teste = false #testa se esta se movendo
	if Input.is_action_pressed("ui_right"):# detcta tecla
		position.x+= velocidade*delta #movimentar o personagem
		#texture.play("default")# dar play em uma animação
		#$AnimatedSprite.scale.x = 1 #muda a direção da animação
		move_teste = true
	
