extends Node

#Shorthand
@onready var dbCore = $databaseCore;
@onready var uiCore = $uiCore;

"""
==============
MISC FUNCTIONS
==============
"""

func beginQuiz():
	dbCore.rebootData();
