#!/bin/bash

BASE_DIR="notebooks/mshumer_gpt-prompt-engineer"

find "$BASE_DIR" -type f -name '*>*' | while read -r FILE
do
  DIR=$(dirname "$FILE")
  BASENAME=$(basename "$FILE")

  #NEW_BASENAME=$(echo "$BASENAME" | tr '>' '_')
  NEW_BASENAME=$(echo "$BASENAME" | tr -d '>')

  NEW_PATH="$DIR/$NEW_BASENAME"

  echo "Renaming: $FILE -> $NEW_PATH"
  mv "$FILE" "$NEW_PATH"
done

