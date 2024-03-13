extends Control

#Shorthand
@onready var displayBox = $Panel/displayBox;

func _process(delta):
	displayBox.text = GameCore.dbCore.questionList[0].displayText;

"""
=======
SIGNALS
=======
"""

func _on_b_answer_pressed(buttonNumber):
	print(buttonNumber)
	answerChoice(buttonNumber);

func _on_b_goto_exit_quiz_pressed():
	exitQuiz();

"""
=======
BUTTONS
=======
"""

func answerChoice(answerNumber):
	pass;

func exitQuiz():
	GameCore.gotoMainMenu();

