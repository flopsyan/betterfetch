#!/usr/bin/env bash

display_models="$(hwinfo --monitor | grep -E "Model" | cut -d\" -f2)"

echo "$display_models"
echo ""
echo "$display_sizes"
echo ""