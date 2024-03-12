extends Node

#Tech
@onready var displayText = "answer!";
@onready var list = []; #List of all quantifiers that will be adjusted by this question, and what they should change by

"""
==============
MISC FUNCTIONS
==============
"""

#Used to populate the answer node w/ its displayText and change list
func init(aText, givenList):
	displayText = aText;
	list = givenList;

#Displays all info relevant to the answerNode, including the display text, and quantifier changes for the answer
func toString():
	print("	a: " + displayText);
