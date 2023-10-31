rm -rf graph
find lib -type d -exec lakos -o graph/{}.dot {} ';'
