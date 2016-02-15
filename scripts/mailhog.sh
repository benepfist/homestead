#!/usr/bin/env bash

echo ">>> Installing Mailhog"

# Download binary from github
sudo wget --quiet -O /usr/bin/mailhog https://github.com/mailhog/MailHog/releases/download/v0.1.8/MailHog_linux_amd64

# Make it executable
sudo chmod +x /usr/bin/mailhog

# Make it start on reboot
sudo tee /etc/init/mailhog.conf <<EOL
description "Mailhog"
start on runlevel [2345]
stop on runlevel [!2345]
respawn
pre-start script
    exec su - vagrant -c "/usr/bin/env /usr/bin/mailhog > /dev/null 2>&1 &"
end script
EOL

# Start it now in the background
sudo service mailhog start