SERVERS=$(basename $(filter-out ca.cnf,$(wildcard *.cnf)))
CSRS=$(addsuffix .csr,$(SERVERS))
CRTS=$(addsuffix .crt,$(SERVERS))
KEYS=$(addsuffix .key,$(SERVERS))

all: $(CRTS) $(KEYS) $(CSRS)

CA=ca.crt ca.key

ca: $(CA) index.txt serial.txt

index.txt:
	touch index.txt

serial.txt:
	echo 01 > serial.txt

ca.crt ca.key: ca.cnf
	yes '' | ./create_ca.sh

%.csr %.key: %.cnf $(CA)
	yes '' | ./create_csr.sh $(basename $<)

%.crt: %.csr %.key $(CA)
	yes | ./sign_crt.sh $(basename $<)

clean:
	rm -f $(CSRS) $(CRTS) $(KEYS)

clean-ca: clean
	rm -f ca.key ca.crt index.txt* serial.txt *.pem
