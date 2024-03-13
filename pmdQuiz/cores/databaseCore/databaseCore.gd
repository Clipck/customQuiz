extends Node

"""
This is where the quiz, and all art-related assets would be loaded. 
"""

#Imports
@onready var questionNodeScene = preload("res://cores/questionNode/questionNode.tscn");

#Shorthand
@onready var questionBank = $questionBank; #Used to denote where the questionNodes should be stored in godot's tree

#Tech
@onready var quizPath = "user://quizFile.json";
@onready var quizData = {};
@onready var questionList = [];

"""
==============
FILE FUNCTIONS
==============
"""

func openFile(filePath):
	#Check that file actually exists
	if(!FileAccess.file_exists(filePath)):
		print("ERROR! NO QUIZ FOUND!");
		return;

	#Open the file as a JSON
	var file = FileAccess.open(filePath, FileAccess.READ);
	var parsed = JSON.parse_string(file.get_as_text());

	#Either return the file, or display an error if something failed along the way
	if(parsed is Dictionary): return parsed;
	else: print("Failed to parse file! Expect trouble");
	return {};

func ingestFile_questions(questionData):
	#Grab question data
	for i in questionData["questions"]:
		var q = questionNodeScene.instantiate();
		questionBank.add_child(q);
		questionList.append(q);
		q.init(i);

"""
==============
MISC FUNCTIONS
==============
"""

func rebootData():
	wipeQuestions();
	quizData = openFile(quizPath);
	ingestFile_questions(quizData["questionData"]);

func wipeQuestions():
	#Clear questionList
	questionList.clear();

	#Remove all nodes from questionBank
	for i in questionBank.get_children(): i.queue_free();

#Displays all info relevant to stored question nodes (such as the question, answers, etc)
func printQuestionData():
	print(quizData["title"]); #Display quiz title
	print(quizData["creator"]); #Display author
	for i in questionList:
		i.toString();
