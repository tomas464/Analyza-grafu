extends Node

func _ready():
	var g = Graph.new()

	g.add_edge("A", "B")
	g.add_edge("B", "C")
	g.add_edge("C", "A", 5)
	g.add_edge("C", "C")

	g.analyze()
