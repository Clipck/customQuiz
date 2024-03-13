extends Control

#Shorthand
@onready var uiCore = get_parent();

"""
===============
GODOT FUNCTIONS
===============
"""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

"""
=======
SIGNALS
=======
"""

func _on_b_begin_pressed():
	begin();


func _on_b_end_pressed():
	exit();

"""
=======
BUTTONS
=======
"""
#Begin game
func begin():
	print("Begin!");
	uiCore.gameCore.beginQuiz();

#Close game
func exit():
	get_tree().quit();

