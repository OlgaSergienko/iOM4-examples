#/bin/bash
mkdir -p build/IS_only_fms2_nonsym_c4/
(cd build/IS_only_fms2_nonsym_c4/; rm -f path_names; \
../../src/mkmf/bin/list_paths -l ./ ../../src/MOM6/{config_src/infra/FMS2,config_src/memory/dynamic_nonsymmetric,config_src/drivers/ice_solo_driver,config_src/external,src/{*,*/*}}/ ; \
../../src/mkmf/bin/mkmf -t ../../src/mkmf/templates/ncrc-intel.mk -o '-I../fms2_c4' -p MOM6 -l '-L../fms2_c4 -lfms' path_names)
(cd build/IS_only_fms2_nonsym_c4/; source ../env_c4; make DEBUG=1 MOM6 -j; cd ../..)
