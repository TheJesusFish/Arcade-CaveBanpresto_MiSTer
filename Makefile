.PHONY: build program copy clean

CORE := Arcade-CaveBanpresto
RBF := output_files/$(CORE).rbf
SOF := output_files/$(CORE).sof

build:
	quartus_sh --flow compile $(CORE)

program:
	quartus_pgm -m jtag -c DE-SoC -o "p;$(SOF)@2"

copy:
	scp $(RBF) root@mister-1:/media/fat/_Arcade/cores

clean:
	rm -rf db greybox_tmp incremental_db output_files build_id.v c5_pin_model_dump.txt jtag.cdf *.qws *.qdf
