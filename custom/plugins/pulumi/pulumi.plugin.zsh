export PATH=$PATH:$HOME/.pulumi/bin

# Always generate completion on load to be sure it is up to date
pulumi completion zsh >| "$ZSH_CACHE_DIR/completions/_pulumi"
autoload -Uz compinit && compinit
compdef _pulumi pulumi

_pulumi_project_file() {
  local current_dir="$PWD"
  while [[ "$current_dir" != "/" ]]; do
    if [[ -f "$current_dir/Pulumi.yaml" ]]; then
      echo "$current_dir/Pulumi.yaml"
      break
    fi
    current_dir="$(dirname "$current_dir")"  # Go up one directory
  done
}

# Function to read the current Pulumi stack
get_pulumi_stack() {
  # Find the path to Pulumi.yaml
  local pulumi_yaml
  pulumi_yaml=$(_pulumi_project_file)
  if [[ -z "$pulumi_yaml" ]]; then
    return 1
  fi

  # Read the top-level key "name" from Pulumi.yaml
  local project_name
  project_name=$(awk -F ': ' '/^name:/ {print $2}' "$pulumi_yaml")
  if [[ -z "$project_name" ]]; then
    return 1
  fi

  # Check if a settings file exists
  local sha1
  sha1=$(echo -n "$pulumi_yaml" | sha1sum | awk '{print $1}')

  local workspace_file
  workspace_file="${HOME}/.pulumi/workspaces/${project_name}-${sha1}-workspace.json"
  if [[ ! -f "$workspace_file" ]]; then
    return 1
  fi

  # Read the stack
  local stack_name
  stack_name=$(jq -r '.stack' "$workspace_file")
  if [[ -z "$stack_name" ]]; then
    return 1
  fi
  echo "$stack_name"
}

pulumi_prompt_info() {
  local stack
  stack=$(get_pulumi_stack)
  if [[ -z "$stack" ]]; then
    return 0
  fi

  echo "📦 ${stack}"
}

# # Pulumi autocompletion using fzf widgets
# _pulumi_fzf() {
#   _pulumi  # call original completion function

#   # Use fzf for filtering if completions are available
#   if [[ ${#COMPREPLY[@]} -ne 0 ]]; then
#     local selected_command
#     selected_command=$(printf '%s\n' "${COMPREPLY[@]}" | fzf --prompt "pulumi> " --height 30% --layout=reverse --tac)

#     if [[ -n $selected_command ]]; then
#       COMPREPLY=("$selected_command")
#     else
#       COMPREPLY=()
#     fi
#   fi
# }

# # local use_fzf
# # zstyle -s ':pulumi:completion:' use-fzf use_fzf

# # if [[ "$use_fzf" == "true" ]]; then
# # fi