cd
git clone https://git.openstack.org/openstack-dev/devstack
cd devstack
cat > /opt/stack/local.conf <<EOL
[[local|localrc]]
ADMIN_PASSWORD=secret
DATABASE_PASSWORD=$ADMIN_PASSWORD
RABBIT_PASSWORD=$ADMIN_PASSWORD
SERVICE_PASSWORD=$ADMIN_PASSWORD
EOL
cd ~/stack
./stack.sh
