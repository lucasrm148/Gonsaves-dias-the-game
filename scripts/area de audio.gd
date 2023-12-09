extends Area2D
@export var paths = ""
var condicional= true
# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2D.stream = load(paths)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if condicional:
		$AudioStreamPlayer2D.play()
		condicional = false
	pass # Replace with function body.

	
