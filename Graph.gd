
class_name Graph

var nodes = []
var edges = []

func add_node(node):
	if not node in nodes:
		nodes.append(node)

func add_edge(a, b, weight = null, directed = false):
	add_node(a)
	add_node(b)
	edges.append([a, b, weight, directed])

func analyze():
	var weighted = false
	var directed = false
	var loops = false

	for e in edges:
		if e[2] != null:
			weighted = true
		if e[3]:
			directed = true
		if e[0] == e[1]:
			loops = true

	var planar = nodes.size() < 3 or edges.size() <= 3 * nodes.size() - 6

	var colors = {}

	for node in nodes:
		var used = []

		for e in edges:
			if e[0] == node and colors.has(e[1]):
				used.append(colors[e[1]])
			if e[1] == node and colors.has(e[0]):
				used.append(colors[e[0]])

		var color = 1
		while color in used:
			color += 1

		colors[node] = color

	var chromatic = 0
	for color in colors.values():
		chromatic = max(chromatic, color)

	print("Uzly: ", nodes.size())
	print("Hrany: ", edges.size())
	print("Ohodnocený: ", weighted)
	print("Orientovaný: ", directed)
	print("Smyčky: ", loops)
	print("Planární (odhad): ", planar)
	print("Chromatické číslo (odhad): ", chromatic)
