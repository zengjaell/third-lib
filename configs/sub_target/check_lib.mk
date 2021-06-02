# ===============================================================
# 
# Release under GPLv-3.0.
# 
# @file    check_lib.mk
# @brief   
# @author  gnsyxiang <gnsyxiang@163.com>
# @date    25/04 2021 13:38
# @version v0.0.1
# 
# @since    note
# @note     note
# 
#     change log:
#     NO.     Author              Date            Modified
#     00      zhenquan.qiu        25/04 2021      create the file
# 
#     last modified: 25/04 2021 13:38
# ===============================================================

_zlib_file := $(prefix_path)/include/zlib.h
check_zlib:
ifneq ($(_zlib_file), $(wildcard $(_zlib_file)))
	$(ECHO) "\tuse \"make project=zlib \" first to compile zlib."
	$(ECHO) ''
	exit 1
endif

_libiconv_file := $(prefix_path)/include/iconv.h
check_libiconv:
ifneq ($(_libiconv_file), $(wildcard $(_libiconv_file)))
	$(ECHO) "\tuse \"make project=libiconv \" first to compile iconv."
	$(ECHO) ''
	exit 1
endif

_openssl_dir := $(prefix_path)/include/openssl
check_openssl: check_zlib
ifneq ($(_openssl_dir), $(wildcard $(_openssl_dir)))
	$(ECHO) "\tuse \"make project=openssl\" first to compile openssl."
	$(ECHO) ''
	exit 1
endif

_png_file := $(prefix_path)/include/png.h
check_libpng:
ifneq ($(_png_file), $(wildcard $(_png_file)))
	$(ECHO) "\tuse \"make project=libpng \" first to compile libpng."
	$(ECHO) ''
	exit 1
endif

_libffi_file := $(prefix_path)/include/ffi.h
check_libffi:
ifneq ($(_libffi_file), $(wildcard $(_libffi_file)))
	$(ECHO) "\tuse \"make project=libffi \" first to compile libffi."
	$(ECHO) ''
	exit 1
endif

_freetype2_dir := $(prefix_path)/include/freetype2
check_freetype:
ifneq ($(_freetype2_dir), $(wildcard $(_freetype2_dir)))
	$(ECHO) "\tuse \"make project=freetype \" first to compile freetype."
	$(ECHO) ''
	exit 1
endif

_glib_dir := $(prefix_path)/include/glib-2.0
check_glib:
ifneq ($(_glib_dir), $(wildcard $(_glib_dir)))
	$(ECHO) "\tuse \"make project=glib \" first to compile glib."
	$(ECHO) ''
	exit 1
endif

_ncurses_dir := $(prefix_path)/include/ncurses
check_ncurses:
ifneq ($(_ncurses_dir), $(wildcard $(_ncurses_dir)))
	$(ECHO) "\tuse \"make project=ncurses\" first to  compile ncurses."
	$(ECHO) ''
	exit 1
endif

_cjson_dir := $(prefix_path)/include/cjson
check_cjson:
ifneq ($(_cjson_dir), $(wildcard $(_cjson_dir)))
	$(ECHO) "\tuse \"make project=cJSON \" first to compile cJSON."
	$(ECHO) ''
	exit 1
endif

_cares_file := $(prefix_path)/include/ares.h
check_cares:
ifneq ($(_cares_file), $(wildcard $(_cares_file)))
	$(ECHO) "\tuse \"make project=c-ares \" first to compile c-ares."
	$(ECHO) ''
	exit 1
endif

_libwebsockets_dir := $(prefix_path)/include/libwebsockets
check_libwebsockets:
ifneq ($(_libwebsockets_dir), $(wildcard $(_libwebsockets_dir)))
	$(ECHO) "\tuse \"make project=libwebsockets \" first to compile libwebsockets."
	$(ECHO) ''
	exit 1
endif

_libpcap_dir := $(prefix_path)/include/pcap
check_libpcap:
ifneq ($(_libpcap_dir), $(wildcard $(_libpcap_dir)))
	$(ECHO) "\tuse \"make project=libpcap\" first to compile libpcap."
	$(ECHO) ''
	exit 1
endif

_mbedtls_dir := $(prefix_path)/include/mbedtls
check_mbedtls:
ifneq ($(_mbedtls_dir), $(wildcard $(_mbedtls_dir)))
	$(ECHO) "\tuse \"make project=mbedtls\" first to compile mbedtls."
	$(ECHO) ''
	exit 1
endif

_libuv_dir := $(prefix_path)/include/uv
check_libuv:
ifneq ($(_libuv_dir), $(wildcard $(_libuv_dir)))
	$(ECHO) "\tuse \"make project=libuv\" first to compile libuv."
	$(ECHO) ''
	exit 1
endif
