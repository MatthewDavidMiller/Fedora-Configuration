#!/bin/bash

# Copyright (c) Matthew David Miller. All rights reserved.
# Licensed under the MIT License.

# Configuration script for Fedora.

# Get script location
# script_location="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

# Get needed scripts
wget -O 'configuration_functions.sh' 'https://raw.githubusercontent.com/MatthewDavidMiller/Fedora-Configuration/stable/linux_scripts/configuration_functions.sh'

# Source functions
source configuration_functions.sh

# Prompts
read -r -p "Run connect_smb script? [y/N] " connect_smb_var
read -r -p "Run mount_drives script? [y/N] " mount_drives_var
read -r -p "Run setup_aliases script? [y/N] " setup_aliases_var
read -r -p "Run setup_git script? [y/N] " configure_git_var

# Call functions
get_username

if [[ "${connect_smb_var}" =~ ^([yY][eE][sS]|[yY])+$ ]]; then
    connect_smb "${user_name}"
fi

if [[ "${mount_drives_var}" =~ ^([yY][eE][sS]|[yY])+$ ]]; then
    mount_drives
fi

if [[ "${setup_aliases_var}" =~ ^([yY][eE][sS]|[yY])+$ ]]; then
    setup_aliases "${user_name}"
fi

if [[ "${configure_git_var}" =~ ^([yY][eE][sS]|[yY])+$ ]]; then
    configure_git "${user_name}"
fi
