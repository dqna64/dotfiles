#!/bin/bash

DOTFILES_DIR="$HOME/.config"
GIT_IDENTITY_FILE="$DOTFILES_DIR/git/git-identity"

# Check if identity file exists
if [[ ! -f "$GIT_IDENTITY_FILE" ]]; then
    echo "Creating git identity file..."
    cp "${GIT_IDENTITY_FILE}.example" "$GIT_IDENTITY_FILE"
    echo "Please edit $GIT_IDENTITY_FILE with your details, then run this script again."
    exit 1
fi

# Source environment variables
source "$GIT_IDENTITY_FILE"

# Function to substitute variables in template
substitute_template() {
    local template_file="$1"
    local output_file="$2"
    
    sed "s/{{PRIMARY_NAME}}/$PRIMARY_NAME/g; \
         s/{{PRIMARY_EMAIL}}/$PRIMARY_EMAIL/g; \
         s/{{SECONDARY_NAME}}/$SECONDARY_NAME/g; \
         s/{{SECONDARY_EMAIL}}/$SECONDARY_EMAIL/g" \
         "$template_file" > "$output_file"
}

# Generate actual config files
substitute_template "$DOTFILES_DIR/git/gitconfig.template" "$HOME/.gitconfig"
substitute_template "$DOTFILES_DIR/git/gitconfig-secondary.template" "$HOME/.gitconfig-personal"

# Symlink global gitignore
ln -sfv "$DOTFILES_DIR/git/gitignore_global" "$HOME/.gitignore_global"

echo "Git configuration installed successfully!"
echo "Primary email: $PRIMARY_EMAIL"
echo "Secondary email: $SECONDARY_EMAIL"
echo ""
echo "Use 'git primary' or 'git secondary' to switch identities"
echo "Use 'git whoami' to check current identity"