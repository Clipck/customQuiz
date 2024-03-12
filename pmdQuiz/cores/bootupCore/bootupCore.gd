extends Node2D

"""
This is where the quiz, and all art-related assets would be loaded. I figure this would double as a
database type of deal
"""

#Imports
@onready var questionNodeScene = preload("res://cores/questionNode/questionNode.tscn");

#Shorthand
@onready var questionBank = $questionBank; #Used to denote where the questionNodes should be stored in godot's tree

#Tech
@onready var questionList = []; #Stores

"""
===============
GODOT FUNCTIONS
===============
"""

# Called when the node enters the scene tree for the first time.
func _ready():
	testPreset();
	print("bootupCore: Initialized");
	printQuestions();

"""
==============
MISC FUNCTIONS
==============
"""

func testPreset():
	var q = questionNodeScene.instantiate();
	questionBank.add_child(q);
	questionList.append(q);

	#Q1
	q.init(
		"What song am I listening to?", 
		[
			["SONG-0", []],
			["SONG-1", []],
			["SONG-2", []],
			["SONG-3", []]
		]
	);

#Displays all info relevant to stored question nodes (such as the question, answers, etc)
func printQuestions():
	for i in questionList:
		i.toString();
