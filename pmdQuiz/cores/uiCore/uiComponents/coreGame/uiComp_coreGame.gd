extends Control

"""
=======
SIGNALS
=======
"""

func _on_b_goto_exit_quiz_pressed():
	exitQuiz();

"""
=======
BUTTONS
=======
"""

func exitQuiz():
	GameCore.gotoMainMenu();
