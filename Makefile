TARGET := $(shell ls *.ros | sed 's/.ros//')
LISP := sbcl-bin


all: $(TARGET)

qlfile.lock: qlfile
	qlot update

%: %.ros | quicklisp
	qlot exec ros -L $(LISP) build $<

quicklisp:
	qlot install

.PHONY: clean rebuild-lock

clean:
	rm -fr quicklisp $(TARGET)

lock:
	qlot update
