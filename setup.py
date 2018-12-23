import fnmatch
import glob
import os

from distutils.core import setup, Extension
from Cython.Build import cythonize

vendor_sources = [
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

include_dirs = [
    "vendor/tree-sitter/include/",
    "vendor/tree-sitter/src/",
    "vendor/tree-sitter/externals/utf8proc"
]

parser_ext = Extension(
    "tree_sitter.parser",
    include_dirs=include_dirs,
    sources= ["tree_sitter/parser.pyx"] + vendor_sources
)

language_ext = Extension(
    "tree_sitter.language",
    include_dirs=include_dirs,
    sources= ["tree_sitter/language.pyx"] + vendor_sources
)

node_ext = Extension(
    "tree_sitter.node",
    include_dirs=include_dirs,
    sources= ["tree_sitter/node.pyx"] + vendor_sources
)

tree_ext = Extension(
    "tree_sitter.tree",
    include_dirs=include_dirs,
    sources= ["tree_sitter/tree.pyx"] + vendor_sources
)


setup(
    name="tree_sitter",
    packages=["tree_sitter", ""],
    package_data={
        'tree_sitter': ['*.pxd'],
    },
    ext_modules=cythonize([parser_ext, language_ext, node_ext, tree_ext])
)
