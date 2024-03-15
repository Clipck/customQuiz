extends Node

#Shorthand
@onready var dbCore = $databaseCore;
@onready var uiCore = $uiCore;

#Tech
@onready var quizProgress = 0; #Tracks what current question we're on, via the index of said question in dbCore's list
@onready var quantifierDict = {}; # quantifierName : points

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

	#Begin the quiz
	quizInit();


#Swap UI to mainMenu
func gotoMainMenu():
	dbCore.wipeQuestions();
	uiCore.swapDisplay(0);

"""
==============
QUIZ FUNCTIONS
==============
"""

#Preps vars for the quiz
func quizInit():
	#Shuffle questionList if needed
	if(dbCore.quizData["questionData"]["randomizedOrder"]): dbCore.questionList.shuffle();

	#Init/reset vars used to track progress during quiz
	quizProgress = 0;
	quantifierDict = {};

	#Load up the first question
	quizQLoad(quizProgress);

#Loads a given question on screen
func quizQLoad(qIndex):
	#Grab shorthand
	var questionNode = dbCore.questionList[qIndex];

	#Load question text
	uiCore.currentDisplay.setQDisplayText(questionNode.displayText);

	#Load answers
	quizQLoad_answers(qIndex);
	for i in questionNode.answerList.size():
		#Game only supports 3 questions rn
		if(i >= 3): break;
		#Load answer text
		uiCore.currentDisplay.setADisplayText(i, questionNode.answerList[i].displayText);
		#Display/hide buttons if needed

#Can only display N total answers on screen at a time, so answerOffset denotes where in answerList to start pulling answers from
func quizQLoad_answers(qIndex, answerOffset = 0):
	#Grab shorthands
	var alQ = dbCore.questionList[qIndex].answerList; #Question node's answer list
	var alB = uiCore.currentDisplay.bAnswerList; #List of all buttons for answering

	#For every answer button on screen, either display an answer or hide the button
	for i in alB.size():
		#If we're out of questions to display, hide the button
		if( (answerOffset + i) >= alQ.size() ): alB[i].visible = false;

		#Otherwise update the button's display properties
		else:
			#Ensure button is visible (as it might've been hidden previously)
			alB[i].visible = true;

			#Display the answer's text
			uiCore.currentDisplay.setADisplayText(i, alQ[answerOffset + i].displayText);

#Processes an answer for the question on screen 
func quizQAnswer(answerNumber):
	#Grab shorthand
	var alQ = dbCore.questionList[quizProgress].answerList;

	#Verify that the button clicked was valid and not somehow out of bounds
	if(answerNumber >= alQ.size()): 
		print("OOB response!");
		return -1;

	#Go through each "outcome" of the answer
	for currOutcome in alQ[answerNumber].list:
		print(currOutcome)
		#If the quantifier is in the dictionary already, update it
		if(quantifierDict.has(currOutcome[0])): quantifierDict[currOutcome[0]] += currOutcome[1];
		#Otherwise, insert it
		else: quantifierDict[currOutcome[0]] = 1;

	#Increment question progress. Determine if we should end quiz or load next question
	quizProgress += 1;
	var endOfQuizCheck = ( quizProgress >= dbCore.questionList.size()); #Check if we've run out of questions to ask

	var questionReq = dbCore.quizData["questionData"]["questionsToAsk"]; #Grab how many questions we need to ask
	var questionReqCheck = (quizProgress >= questionReq) && (questionReq > 0); #Check if we've met said requirement
	if( questionReqCheck || endOfQuizCheck ): 
		quizEvaluate();
	else: 
		quizQLoad(quizProgress);

func quizEvaluate():
	#Determine the highest scoring quantifier by cycling through every key
	var highestQuantifier = null;
	for key in quantifierDict:
		if( 
			(highestQuantifier == null) || #If this is the first key, go ahead and record it as our initial high score
			(quantifierDict[highestQuantifier] < quantifierDict[key]) #If this key beats our recorded high score, update it
		): 
			highestQuantifier = key;

	#Prep the visuals of the "evaluation screen"
		#Update visibility of buttons and text
	uiCore.currentDisplay.setAControlVisibility(false);
	uiCore.currentDisplay.setFTextVisibility(true);
		#Display actual quiz results
	var qDisplayText = dbCore.quizData["quantifierData"]["evaluationDisplay"] + highestQuantifier;
	uiCore.currentDisplay.setQDisplayText(qDisplayText);

		#This is some really gross logic + string construction but I kinda wanna be done w/ this project now and hand it to friends to play with
	var fDisplayText = dbCore.quizData["quantifierData"]["poolDisplay"];
	var resultPool = dbCore.quizData["quantifierData"]["quantifierPools"][highestQuantifier]
	for i in resultPool.size():
		if(i > 0): 
			if(i < resultPool.size()-1): fDisplayText += ", a ";
			else: fDisplayText += " or a ";
		fDisplayText += dbCore.quizData["quantifierData"]["quantifierPools"][highestQuantifier][i];
	uiCore.currentDisplay.setFDisplayText(fDisplayText);
