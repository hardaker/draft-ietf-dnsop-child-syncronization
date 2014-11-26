PREFIX=draft-ietf-dnsop-child-syncronization
VERSION=04

#RFC=rfc6168

# new drafts

MONTH=`date +"%B"`
YEAR=`date +"%Y"`

OUT=$(PREFIX)-$(VERSION).txt

all:  $(OUT)

$(OUT): draft-tmp.xml
	DISPLAY= ./xml2rfc.tcl $< $@
#	rm -f $<

draft-tmp.xml: $(PREFIX).xml
	sed -e "s/FILLMONTH/$(MONTH)/;s/FILLYEAR/$(YEAR)/;s/FILLVERSION/$(VERSION)/" $< | perl makerfcs > $@


nits: $(OUT)
	idnits $(OUT)
