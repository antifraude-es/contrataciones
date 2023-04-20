#!/usr/bin/env python3

"""_summary_.
"""

import argparse
from typing import cast

from .utilities.ArgsNamespace import ArgsNamespace
from .utilities.CustomHelpFormatter import CustomHelpFormatter


def main():
    """Definición de parámetros."""
    parser = argparse.ArgumentParser(
        description="Describe tu proyecto.", formatter_class=CustomHelpFormatter
    )
    parser.add_argument(
        "-v", "--version", action="version", version="contrataciones 0.1"
    )
    parser.add_argument("-n", "--name", metavar="<name>", help="Un parámetro opcional.")
    parser.add_argument(
        "-e", "--extra", action="store_true", help="Este valor es falso por defecto."
    )

    args: ArgsNamespace = cast(ArgsNamespace, parser.parse_args())

    if args.name and args.extra:
        print("Hello There " + args.name + "!")
    elif args.extra:
        print("Hello There!")
    elif args.name:
        print("Hello " + args.name + "!")
    else:
        print("Hello World!")
