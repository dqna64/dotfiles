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
         s/{{SECONDARY_EMAIL}}/$SECONDARY_EMAIL/g; \
         s|{{PRIMARY_REMOTE_ACCOUNT_SSH_PUBLIC_KEY}}|$PRIMARY_REMOTE_ACCOUNT_SSH_PUBLIC_KEY|g; \
         s|{{SECONDARY_REMOTE_ACCOUNT_SSH_PUBLIC_KEY}}|$SECONDARY_REMOTE_ACCOUNT_SSH_PUBLIC_KEY|g" \
         "$template_file" > "$output_file"
}

# Generate actual config files
substitute_template "$DOTFILES_DIR/git/gitconfig.template" "$HOME/.gitconfig"
substitute_template "$DOTFILES_DIR/git/gitconfig-secondary.template" "$HOME/.gitconfig-personal"

# Symlink global gitignore
ln -sfv "$DOTFILES_DIR/git/gitignore_global" "$HOME/.gitignore_global"

echo "Git configuration installed successfully!"

echo "==="

echo "🎯 Git identity:"
echo "   Primary email: $PRIMARY_EMAIL"
echo "   Secondary email: $SECONDARY_EMAIL"
echo "   $ git primary        # Switch to primary identity"
echo "   $ git secondary      # Switch to secondary identity"  
echo "   $ git whoami         # Check current identity"
echo "==="
echo "🔑 GitHub account SSH key:"
echo "   Primary github account ssh key: $PRIMARY_REMOTE_ACCOUNT_SSH_PUBLIC_KEY"
echo "   Secondary github account ssh key: $SECONDARY_REMOTE_ACCOUNT_SSH_PUBLIC_KEY"
echo "   $ git ssh-primary    # Switch to primary GitHub account SSH key path"
echo "   $ git ssh-secondary  # Switch to secondary GitHub account SSH key path"
echo "   $ git ssh-whoami     # Check current GitHub account SSH key path"

echo "==="
