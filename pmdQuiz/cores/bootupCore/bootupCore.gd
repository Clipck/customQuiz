extends Node2D

"""
This is where the quiz, and all art-related assets would be loaded. I figure this would double as a
database type of deal
"""

#Imports
@onready var questionNodeScene = preload("res://cores/questionNode/questionNode.tscn");
@onready var answerNodeScene = preload("res://cores/answerNode/answerNode.tscn");

#Tech
@onready var questionList = [];

"""
===============
GODOT FUNCTIONS
===============
"""

# Called when the node enters the scene tree for the first time.
func _ready():
	testPreset();
	print("bootupCore: Initialized");

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

"""
==============
MISC FUNCTIONS
==============
"""

func testPreset():
	print("testPreset: starting");
	print("testPreset: finished");
