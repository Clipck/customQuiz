extends Control

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
	GameCore.gotoCoreGame();

#Close game
func exit():
	get_tree().quit();

