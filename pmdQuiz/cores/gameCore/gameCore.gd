extends Node

#Shorthand
@onready var dbCore = $databaseCore;
@onready var uiCore = $uiCore;

"""
==============
GOTO FUNCTIONS
==============
"""

#Swap UI to coreGame (the quiz)
func gotoCoreGame():
	uiCore.swapDisplay(1);

	#Load quiz data up
	dbCore.rebootData();


#Swap UI to mainMenu
func gotoMainMenu():
	dbCore.wipeQuestions();
	uiCore.swapDisplay(0);
