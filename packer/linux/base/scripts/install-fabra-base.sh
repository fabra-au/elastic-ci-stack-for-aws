#!/usr/bin/env bash

set -euo pipefail

echo Updating core packages

sudo dnf upgrade -y ca-certificates
sudo update-ca-trust

echo Install phase cli
curl -fsSL https://pkg.phase.dev/install.sh | bash
phase --version

echo Install encore cli
curl -L https://encore.dev/install.sh | bash

echo "Copying encore binary to /usr/local/bin for system-wide access..."
sudo cp $HOME/.encore/bin/encore /usr/local/bin/encore
sudo chown root:root /usr/local/bin/encore
sudo chmod +x /usr/local/bin/encore

echo "Verifying encore is available system-wide..."
which encore
encore version

echo Install Node.js
sudo dnf install -y nodejs20 
node -v
npm -v

echo Install bun
curl -fsSL https://bun.sh/install | bash

echo "Copying bun binary to /usr/local/bin for system-wide access..."
sudo cp $HOME/.bun/bin/bun /usr/local/bin/bun
sudo chown root:root /usr/local/bin/bun
sudo chmod +x /usr/local/bin/bun

echo "Copying bunx binary to /usr/local/bin for system-wide access..."
sudo cp $HOME/.bun/bin/bunx /usr/local/bin/bunx
sudo chown root:root /usr/local/bin/bunx
sudo chmod +x /usr/local/bin/bunx

echo "Verifying bun is available system-wide..."
which bun
bun --version
which bunx
bunx --version

echo "Setting directory permissions..."
sudo chmod 755 /usr/local/bin
sudo chmod 755 /usr/local