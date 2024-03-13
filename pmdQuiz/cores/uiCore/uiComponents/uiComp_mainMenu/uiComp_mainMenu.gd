extends Control

#Shorthand
@onready var uiCore = get_parent();

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

