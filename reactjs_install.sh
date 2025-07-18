#!/bin/bash

set -e

usage() {
  echo "Usage: $0 -v <react_version> [-d <project_dir>] [-u]"
  echo "  -v, --version     React version to install (required)"
  echo "  -d, --directory   Target project directory (default: current directory)"
  echo "  -u, --upgrade     Force upgrade/downgrade to specified version"
  echo "  -h, --help        Show this help message"
  exit 1
}

REACT_VERSION=""
PROJECT_DIR="."
FORCE_UPGRADE=false

while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
    -v|--version)
      REACT_VERSION="$2"
      shift; shift
      ;;
    -d|--directory)
      PROJECT_DIR="$2"
      shift; shift
      ;;
    -u|--upgrade)
      FORCE_UPGRADE=true
      shift
      ;;
    -h|--help)
      usage
      ;;
    *)
      echo "Unknown option: $1"
      usage
      ;;
  esac
done

if [[ -z "$REACT_VERSION" ]]; then
  echo "Error: React version is required."
  usage
fi

cd "$PROJECT_DIR"

if [ ! -f package.json ]; then
  echo "Initializing npm project..."
  npm init -y
fi

if $FORCE_UPGRADE; then
  echo "Installing React@$REACT_VERSION (forced)..."
  npm install react@$REACT_VERSION react-dom@$REACT_VERSION --save --force
else
  echo "Installing/Updating React@$REACT_VERSION..."
  npm install react@$REACT_VERSION react-dom@$REACT_VERSION --save
fi

echo "React@$REACT_VERSION installation complete in $PROJECT_DIR"
