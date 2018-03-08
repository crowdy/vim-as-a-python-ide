yum install -y the_silver_searcher
yum install -y pcre-devel automake 
yum install xz-devel
cd /usr/local/src
git clone https://github.com/ggreer/the_silver_searcher.git
cd the_silver_searcher
./build.sh
make install

sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
sudo yum install ripgrep
