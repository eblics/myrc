# remove current vim
apt-get remove --purge vim vim-runtime vim-gnome vim-tiny vim-gui-common
#
## removes current link for vim
rm -rf /usr/local/share/vim /usr/bin/vim
#
## add ppa for newest version of ruby (currently, as of 06/06/2017, ruby v2.4)
apt-add-repository ppa:brightbox/ruby-ng
apt-get update
#
## installs everything needed to make/configure/build Vim
apt-get -y install liblua5.1-dev luajit libluajit-5.1 python3-dev ruby-dev ruby2.1 ruby2.1w-dev libperl-dev libncurses5-dev libatk1.0-dev libx11-dev libxpm-dev libxt-dev
#
##Optional: so vim can be uninstalled again via `dpkg -r vim`
apt-get -y install checkinstall
#
## clones vim repository so we can build it from scratch
cd ~
git clone https://github.com/vim/vim
cd vim
git pull && git fetch

# In case Vim was already installed. This can throw an error if not installed, 
# it's the nromal behaviour. That's no need to worry about it
cd src
make distclean
cd ..

# update to use the correct python 2.7/3.x config path also change 'YOUR NAME' to
# your real name
./configure \
--enable-multibyte \
--enable-perlinterp=dynamic \
--enable-rubyinterp=dynamic \
--with-ruby-command=/usr/bin/ruby \
#--enable-pythoninterp=dynamic \
#--with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
--enable-python3interp \
--with-python3-config-dir=/usr/lib/python3.4/config-3.4m-x86_64-linux-gnu/ \
--enable-luainterp \
--with-luajit \
--enable-cscope \
--enable-gui=auto \
--with-features=huge \
#--with-x \
--enable-fontset \
--enable-largefile \
--disable-netbeans \
--with-compiledby="eblics" \
--enable-fail-if-missing

# this this is the compilation step. It should also create the symlink of the binary
# one /usr/bin folder
make &&  make install

# To be able to access the new vim instaltion we need to refresh bash/zsh/fish
exec bash
