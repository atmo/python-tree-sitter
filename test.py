from parser import Parser
from tree_sitter_json import get_language

def main():
    parser = Parser()
    language = get_language()
    result = parser.set_language(language)
    source = "[1, null]"
    tree = parser.parse(source)
    root = tree.root_node()
    print(root)

if __name__ == "__main__":
    main()