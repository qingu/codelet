from Cython.Build import cythonize
from setuptools import setup

setup(
    name="hello world app",
    ext_modules=cythonize("hello.pyx"),
)
