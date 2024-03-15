extends Control

#Shorthand
@onready var finalText = $finalText;
@onready var answerControl = $answerControl;

@onready var qDisplayText = $mainText/displayBox;
@onready var fDisplayText = $finalText/displayBox;
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
#Text
func setQDisplayText(text):
	qDisplayText.text = text;

func setADisplayText(buttonIndex, text):
	bAnswerList[buttonIndex].text = text;

func setFDisplayText(text):
	fDisplayText.text = text;
#Visibility
func setAControlVisibility(vis):
	answerControl.visible = vis;

func setFTextVisibility(vis):
	finalText.visible = vis;
