extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const max_x = 64
const max_y = 32
var cel_x = 0
var cel_y = 0
var timerdead = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Bucle
	if Glovar.Paused == false:
		if timerdead == true:
			cel_x= 0
			cel_y=0
			timerdead = false
			$Timer.start()
			for cel_x in range(max_x):
				for cel_y in range(max_y):
					var around = $life.get_cell(cel_x-1,cel_y) + $life.get_cell(cel_x-1,cel_y-1) + $life.get_cell(cel_x-1,cel_y+1) + $life.get_cell(cel_x,cel_y-1) + $life.get_cell(cel_x,cel_y+1) + $life.get_cell(cel_x+1,cel_y) + $life.get_cell(cel_x+1,cel_y-1) + $life.get_cell(cel_x+1,cel_y+1)
					#print(str(cel_x) + " " + str(cel_y))
					#print(around)
					if around == 3:
						if $life.get_cell(cel_x,cel_y) == 0:
							$new_life.set_cell(cel_x,cel_y,1)
					if around > 3 or around < 2:
						$new_life.set_cell(cel_x,cel_y,0)
					#set_cell(cel_x,cel_y,0)
			cel_x = 0
			cel_y = 0
			for cel_x in range(max_x):
				for cel_y in range(max_y):
					$life.set_cell(cel_x,cel_y,$new_life.get_cell(cel_x,cel_y))



func _on_Timer_timeout():
	timerdead = true
