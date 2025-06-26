#!/bin/bash

# GitHub API URL
API_URL="https://api.github.com"

# GitHub username and token from environment variables
USERNAME=$username
TOKEN=$token

# User and repo info
REPO_OWNER=$1
REPO_NAME=$2

# Function to make a GET request to the GitHub API
github_api_get() {
  local endpoint="$1"
  local url="${API_URL}/${endpoint}"

  curl -s -u "${USERNAME}:${TOKEN}" "$url"
}

# Function to list users with read access
list_user_with_read_access() {
  local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"
  response=$(github_api_get "$endpoint")

  # Debug: print raw response
  echo "Raw API response:"
  echo "$response"

  collaborators=$(echo "$response" | jq -r '.[] | select(.permissions.pull == true) | .login')

  if [ -z "$collaborators" ]; then
    echo "No users with read access found for ${REPO_OWNER}/${REPO_NAME}."
  else
    echo "Users with read access to ${REPO_OWNER}/${REPO_NAME}:"
    echo "$collaborators"
  fi
}

# Call the function
list_user_with_read_access

