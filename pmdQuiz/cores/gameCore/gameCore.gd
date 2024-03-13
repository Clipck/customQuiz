extends Node

#Shorthand
@onready var dbCore = $databaseCore;

"""
===============
GODOT FUNCTIONS
===============
"""

# Called when the node enters the scene tree for the first time.
func _ready():
	dbCore.rebootData();
	print("GameCore: Initialized");

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

"""
==============
MISC FUNCTIONS
==============
"""
