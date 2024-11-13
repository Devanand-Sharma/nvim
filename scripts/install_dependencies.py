#!/usr/bin/env python3

import platform
import subprocess
import sys
import os
from typing import List, Dict

class DependencyInstaller:
    def __init__(self):
        self.system = platform.system().lower()
        if self.system == "linux":
            # Check for Ubuntu/Debian
            if os.path.exists("/etc/debian_version"):
                self.system = "ubuntu"
            else:
                print("This script currently only supports Ubuntu/Debian Linux distributions")
                sys.exit(1)

    def run_command(self, command: List[str], check: bool = True) -> None:
        """Run a command and handle errors."""
        try:
            print(f"Running: {' '.join(command)}")
            subprocess.run(command, check=check)
        except subprocess.CalledProcessError as e:
            print(f"Error running command: {e}")
            if check:
                sys.exit(1)

    def check_package_manager(self) -> None:
        """Verify and setup package managers."""
        if self.system == "darwin":  # macOS
            try:
                subprocess.run(["brew", "--version"], check=True, capture_output=True)
            except subprocess.CalledProcessError:
                print("Installing Homebrew...")
                install_cmd = '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
                self.run_command(install_cmd.split())
        elif self.system == "windows":
            try:
                subprocess.run(["winget", "--version"], check=True, capture_output=True)
            except subprocess.CalledProcessError:
                print("Please install Windows Package Manager (winget) from the Microsoft Store")
                sys.exit(1)

    def install_base_dependencies(self) -> None:
        """Install basic dependencies required across all systems."""
        commands = {
            "ubuntu": [
                ["sudo", "apt", "update"],
                ["sudo", "apt", "install", "-y", "git", "gcc", "ripgrep", "nodejs", "npm", "curl"],
            ],
            "darwin": [
                ["brew", "install", "git", "gcc", "ripgrep", "node"],
            ],
            "windows": [
                ["winget", "install", "Git.Git"],
                ["winget", "install", "Microsoft.VisualStudio.BuildTools"],
                ["winget", "install", "BurntSushi.ripgrep.MSVC"],
                ["winget", "install", "OpenJS.NodeJS"],
            ],
        }

        for cmd in commands.get(self.system, []):
            self.run_command(cmd)

    def install_python_dependencies(self) -> None:
        """Install Python and related tools."""
        commands = {
            "ubuntu": [
                ["sudo", "apt", "install", "-y", "python3", "python3-pip"],
            ],
            "darwin": [
                ["brew", "install", "python"],
            ],
            "windows": [
                ["winget", "install", "Python.Python.3.10"],
            ],
        }

        for cmd in commands.get(self.system, []):
            self.run_command(cmd)

        # Install Python packages
        pip_packages = ["black", "isort", "ruff"]
        self.run_command([sys.executable, "-m", "pip", "install", "--user"] + pip_packages)

    def install_go_dependencies(self) -> None:
        """Install Go and related tools."""
        commands = {
            "ubuntu": [
                ["sudo", "apt", "install", "-y", "golang"],
            ],
            "darwin": [
                ["brew", "install", "go"],
            ],
            "windows": [
                ["winget", "install", "GoLang.Go"],
            ],
        }

        for cmd in commands.get(self.system, []):
            self.run_command(cmd)

        # Install Go tools
        go_packages = [
            "golang.org/x/tools/gopls@latest",
            "github.com/golangci/golangci-lint/cmd/golangci-lint@latest",
            "mvdan.cc/gofumpt@latest",
            "github.com/incu6us/goimports-reviser/v3@latest",
        ]
        for package in go_packages:
            self.run_command(["go", "install", package])

    def install_cpp_dependencies(self) -> None:
        """Install C/C++ development tools."""
        commands = {
            "ubuntu": [
                ["sudo", "apt", "install", "-y", "clang", "clangd", "clang-format", "cmake"],
            ],
            "darwin": [
                ["brew", "install", "llvm", "cmake"],
            ],
            "windows": [
                ["winget", "install", "LLVM.LLVM"],
                ["winget", "install", "Kitware.CMake"],
            ],
        }

        for cmd in commands.get(self.system, []):
            self.run_command(cmd)

    def install_latex_dependencies(self) -> None:
        """Install LaTeX and related tools."""
        commands = {
            "ubuntu": [
                ["sudo", "apt", "install", "-y", "texlive-full", "latexmk"],
            ],
            "darwin": [
                ["brew", "install", "--cask", "mactex"],
                ["brew", "install", "--cask", "skim"],
            ],
            "windows": [
                ["winget", "install", "MiKTeX.MiKTeX"],
                ["winget", "install", "SumatraPDF.SumatraPDF"],
            ],
        }

        for cmd in commands.get(self.system, []):
            self.run_command(cmd)

    def install_node_packages(self) -> None:
        """Install global npm packages."""
        packages = ["pyright"]
        self.run_command(["npm", "install", "-g"] + packages)

    def install_all(self) -> None:
        """Install all dependencies."""
        print(f"Installing dependencies for {self.system}")
        
        self.check_package_manager()
        
        steps = [
            ("Installing base dependencies...", self.install_base_dependencies),
            ("Installing Python dependencies...", self.install_python_dependencies),
            ("Installing Go dependencies...", self.install_go_dependencies),
            ("Installing C/C++ dependencies...", self.install_cpp_dependencies),
            ("Installing LaTeX dependencies...", self.install_latex_dependencies),
            ("Installing Node.js packages...", self.install_node_packages),
        ]

        for message, step in steps:
            print("\n" + "=" * 50)
            print(message)
            print("=" * 50)
            try:
                step()
            except Exception as e:
                print(f"Error during {message.lower()}: {e}")
                print("Continuing with remaining installations...")

        print("\nInstallation complete! Please restart your terminal.")
        print("After restarting, run :checkhealth in Neovim to verify the installation.")

def main():
    if os.geteuid() == 0 and platform.system().lower() != "windows":  # Skip check on Windows
        print("Please do not run this script as root/sudo")
        sys.exit(1)

    installer = DependencyInstaller()
    installer.install_all()

if __name__ == "__main__":
    main()