extends Control

#Imports
@onready var mainMenuScene = preload("res://cores/uiCore/uiComponents/mainMenu/uiComp_mainMenu.tscn");
@onready var coreGameScene = preload("res://cores/uiCore/uiComponents/coreGame/uiComp_coreGame.tscn");

#Shorthand
@onready var currentDisplay = $menuMain;

"""
=======
DISPLAY
=======
"""

func swapDisplay(displayMode):
	#Remove prior display
	currentDisplay.queue_free();

	#Instantiate new display's scene
	var instanceID;
	match displayMode:
		#Main menu
		0: instanceID = mainMenuScene.instantiate();

		#coreGameScene
		1: instanceID = coreGameScene.instantiate();

	#Add it to the tree
	self.add_child(instanceID);
	currentDisplay = instanceID;
