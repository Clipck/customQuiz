extends Node

@onready var questionText = "I have a question.";
@onready var answerList = [];

"""
===============
GODOT FUNCTIONS
===============
"""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

"""
==============
MISC FUNCTIONS
==============
"""

func init(qText, aList):
	questionText = qText;
	answerList = aList;
	print("initialized");
