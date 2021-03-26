#!/bin/bash

sudo apt install -y julia
julia -e "import Pkg; Pkg.add("Pluto")"
