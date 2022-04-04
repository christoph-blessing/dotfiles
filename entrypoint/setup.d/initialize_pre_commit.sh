#!/bin/sh

if ! command -v pre-commit > /dev/null 2>&1; then
  echo "Pre-commit is not installed."
  exit 1
fi

if [ ! -f ".pre-commit-config.yaml" ]; then
  echo "Pre-commit config not found."
  exit 1
fi

pre-commit > /dev/null
