import glob

from distutils.core import setup, Extension
from Cython.Build import cythonize

ext = Extension(
    "parser",
    include_dirs=["vendor/tree-sitter/include/", "vendor/tree-sitter/vendor/tree-sitter/src/", "vendor/tree-sitter/externals/utf8proc"],
    sources=[
        "parser.pyx",
        'vendor/tree-sitter/src/runtime/get_changed_ranges.c',
        'vendor/tree-sitter/src/runtime/language.c',
        'vendor/tree-sitter/src/runtime/lexer.c',
        'vendor/tree-sitter/src/runtime/node.c',
        'vendor/tree-sitter/src/runtime/stack.c',
        'vendor/tree-sitter/src/runtime/parser.c',
        'vendor/tree-sitter/src/runtime/subtree.c',
        'vendor/tree-sitter/src/runtime/tree.c',
        'vendor/tree-sitter/src/runtime/tree_cursor.c',
        'vendor/tree-sitter/src/runtime/utf16.c',
        'vendor/tree-sitter/externals/utf8proc/utf8proc.c',
        ]
)

setup(ext_modules=cythonize([ext]))