extends Node2D
var velocidade= 30 
var salto = 30 
var move_teste =false
var direction = 1
@onready var texture :=$AnimatedSprite
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
		texture.play("default")# dar play em uma animação
		$AnimatedSprite.scale.x = 1 #muda a direção da animação
		move_teste = true
	
	#copia e cola 
	elif Input.is_action_pressed("ui_left"):
		position.x-= velocidade*delta 
		texture.play("default")
		$AnimatedSprite.scale.x = -1
		move_teste = true
		
	if Input.is_action_pressed("ui_up"):#pulo
		position.y-= salto*delta 
		texture.play("default")
		move_teste =true
	
	if !move_teste:# parado 
		texture.play("default")#para a animação quando parado
		
