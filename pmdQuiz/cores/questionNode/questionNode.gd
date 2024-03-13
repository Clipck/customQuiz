extends Node

#Imports
@onready var answerNodeScene = preload("res://cores/answerNode/answerNode.tscn");

#Tech
@onready var displayText = "I have a question.";
@onready var answerList = [];

"""
==============
MISC FUNCTIONS
==============
"""

func init(data):
	displayText = data[0];
	initAnswers(data[1]);

func toString():
	print("q: " + displayText);
	for i in answerList:
		i.toString();

#Takes care of generating answerNodes
func initAnswers(aList):
	#For every answer in the list...
	for i in aList:
		var a = answerNodeScene.instantiate(); #Create a new answerNode instance
		self.add_child(a); #Store the answerNode under this questionNode
		answerList.append(a); #Store a reference to the answerNode in answerList
		a.init(i[0], i[1]);
