extends Node

var coins = 100
var inventory = {"energy_drink": 0, "flashlight": 0, "gas": 0}
var done_quests: int = 0
var completed_quests = []
var current_quest: quest
signal load_quest(quest)
