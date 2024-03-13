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
@onready var quizData = {};
@onready var quizPath = "user://prototype0.5.txt";
@onready var questionList = [];

@onready var questionsToAsk = 0; #If <= 0, asks all questions. Otherwise, it'll ask the first N questions
@onready var randomzedOrder = false; #If you aren't asking all the questions, it's recommended to randomize the question order

"""
===============
GODOT FUNCTIONS
===============
"""

# Called when the node enters the scene tree for the first time.
func _ready():
	quizData = openFile(quizPath);
	ingestFile_questions(quizData["questionData"]);
	printQuestions();

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

	#Grab misc info
	questionsToAsk = questionData["questionsToAsk"];
	randomzedOrder = questionData["randomizedOrder"];

"""
==============
MISC FUNCTIONS
==============
"""

#Displays all info relevant to stored question nodes (such as the question, answers, etc)
func printQuestions():
	for i in questionList:
		i.toString();
