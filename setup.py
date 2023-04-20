#!/usr/bin/env python3

"""Configuración."""

from setuptools import setup, find_packages

setup(
    name="Contrataciones",
    version="0.0.1",
    author="%{AUTHOR}",
    author_email="%{EMAIL}",
    description="%{DESCRIPTION}",
    url="%{URL}",
    entry_points={
        "console_scripts": ["contrataciones = contrataciones.main:main"],
    },
    packages=find_packages(),
)
