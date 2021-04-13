extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var positionmouse = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	positionmouse = get_global_mouse_position() / 16
	positionmouse = Vector2(int(positionmouse.x),int(positionmouse.y))
	Glovar.PositionMouseCalculed = positionmouse
	if Input.is_action_just_pressed("end"):
		if Glovar.Paused == true:
			Glovar.Paused = false
		else:
			Glovar.Paused = true

