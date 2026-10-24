#DU graf
class Graph:
    def __init__(self):
        self.nodes = []
        self.edges = []

    def add_node(self, node):
        if node not in self.nodes:
            self.nodes.append(node)

    def add_edge(self, a, b, weight=None, directed=False):
        self.add_node(a)
        self.add_node(b)
        self.edges.append([a, b, weight, directed])

    def analyze(self):
        weighted = any(e[2] != None for e in self.edges)
        directed = any(e[3] for e in self.edges)
        loops = any(e[0] == e[1] for e in self.edges)

        planar = len(self.nodes) < 3 or len(self.edges) <= 3 * len(self.nodes) - 6

        colors = {}
        for node in self.nodes:
            used = []
            for a, b, w, d in self.edges:
                if a == node and b in colors:
                    used.append(colors[b])
                if b == node and a in colors:
                    used.append(colors[a])

            color = 1
            while color in used:
                color += 1
            colors[node] = color

        print("Uzly:", len(self.nodes))
        print("Hrany:", len(self.edges))
        print("Ohodnocený:", weighted)
        print("Orientovaný:", directed)
        print("Smyčky:", loops)
        print("Planární (odhad):", planar)
        print("Chromatické číslo (odhad):", max(colors.values(), default=0))


g = Graph()
g.add_edge("A", "B")
g.add_edge("B", "C")
g.add_edge("C", "A", 5)
g.add_edge("C", "C")

g.analyze()
