GEM := mruby-fluent-logger

include $(MAKEFILE_4_GEM)

GEM_RB_FILES := $(wildcard $(MRB_DIR)/*.rb)

gem-all : gem-rb-files

gem-clean : gem-clean-rb-files
