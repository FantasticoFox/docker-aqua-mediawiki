FROM prowiki/mediawiki:37

# Define the MW_ROOT in MediaWiki as a variable name.
ENV MW_ROOT /var/www/html

# Make sure that existing software are updated and install development tools.
# The /etc/apt/preferences.d/no-debian-php is to ensure that we can install php-zip.
# We need php-zip so that Composer can install packages.
# TODO remove the /etc/apt/preferences.d/no-debian-php and apt-get -q install -y --no-install-recommends zip unzip php-zip once we upgrade to 1.36 because they are not necessary anymore.
RUN set -ex && \
    apt-get -q update && apt-get upgrade -y && \
    apt-get -q install -y --no-install-recommends nano vim ripgrep tig fd-find && \
    rm /etc/apt/preferences.d/no-debian-php && \
    apt-get -q install -y --no-install-recommends zip unzip php-zip && \
    apt-get -q install -y --no-install-recommends mariadb-client && \
    rm -rf /var/lib/apt/lists/*  # Remove unnecessary apt cache to keep the layer small

# Define working directory for the following commands
WORKDIR ${MW_ROOT}

# Copy Tweeki skin to skins/
COPY ./skins/Tweeki skins/Tweeki

# Copy extensions
COPY ./extensions extensions

# Copy the php.ini with desired upload_max_filesize into the php directory.
COPY ./resources/php.ini /usr/local/etc/php/php.ini
# Copy more assets and composer file.
COPY ./resources/aqua.png resources/assets/aqua.png
COPY ./composer.local.json composer.local.json

# Install the latest version of PHP package manager "Composer" and install
# MW-OAuth2Client from Git master.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer && \
    composer update --no-dev && \
    cd extensions && \
    git clone https://github.com/rht/MW-OAuth2Client.git && \
    cd MW-OAuth2Client && \
    git submodule update --init && \
    cd vendors/oauth2-client && \
    composer install
