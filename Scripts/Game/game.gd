extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const max_x = 64
const max_y = 32

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("esc"):
		get_tree().quit()
	if Input.is_action_pressed("clickizq"):
		Glovar.ClickMouse = 1
	elif Input.is_action_pressed("clickder"):
		Glovar.ClickMouse = 2
	else:
		Glovar.ClickMouse = 0
	if Glovar.PositionMouseCalculed.x >= 0 and Glovar.PositionMouseCalculed.x < max_x:
		if Glovar.PositionMouseCalculed.y >= 0 and Glovar.PositionMouseCalculed.y < max_y:
			if Glovar.ClickMouse == 1:
				$lifes/life.set_cellv(Glovar.PositionMouseCalculed, 1)
				$lifes/new_life.set_cellv(Glovar.PositionMouseCalculed, 1)
			if Glovar.ClickMouse == 2:
				$lifes/life.set_cellv(Glovar.PositionMouseCalculed, 0)
				$lifes/new_life.set_cellv(Glovar.PositionMouseCalculed, 0)
