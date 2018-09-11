DIRS := crypt
SENTINELS := $(foreach d,$(DIRS),$d/.sentinel)

all: $(SENTINELS)

% :: %.tar.gz.gpg
	gpg -d -o decrypted $^
	tar xzf decrypted && rm -rf decrypted

.PRECIOUS: % %/.sentinel
%/.sentinel : | %
	touch $@
