rm -rf graph/dot
find lib -type d -exec lakos -o graph/dot/{}.dot {} ';'
