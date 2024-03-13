extends Control

#Shorthand
@onready var displayBox = $Panel/displayBox;
@onready var bAnswerList = [$answerControl/bAnswer0, $answerControl/bAnswer1, $answerControl/bAnswer2];

"""
=======
SIGNALS
=======
"""

func _on_b_answer_pressed(buttonNumber):
	answerChoice(buttonNumber);

func _on_b_goto_exit_quiz_pressed():
	exitQuiz();

"""
=============
BUTTON INPUTS
=============
"""

func answerChoice(answerNumber):
	GameCore.quizQAnswer(answerNumber);

func exitQuiz():
	GameCore.gotoMainMenu();

"""
===============
DISPLAY CONTROL
===============
"""

func setQDisplayText(text):
	displayBox.text = text;

func setADisplayText(buttonIndex, text):
	bAnswerList[buttonIndex].text = text;

