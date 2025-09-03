MODULES = uint128
EXTENSION = uint128
DATA = uint128--1.0.0.sql uint128--1.0.0--1.0.1.sql uint128--1.0.1--1.1.0.sql
REGRESS = create_ext test_uint1 test_uint2 test_uint4 test_uint8 test_uint16 test_int1 test_int16

MODULE_big = $(EXTENSION)
OBJS = magic.o uint128.o uint64.o uint32.o uint16.o uint8.o int128.o int8.o uint_utils.o int_utils.o numeric_utils.o \
	cmp/int8.o cmp/int16.o cmp/int32.o cmp/int64.o cmp/int128.o \
	cmp/uint8.o cmp/uint16.o cmp/uint32.o cmp/uint64.o cmp/uint128.o \
	arithm/int8.o arithm/int16.o arithm/int32.o arithm/int64.o arithm/int128.o \
	arithm/uint8.o arithm/uint16.o arithm/uint32.o arithm/uint64.o arithm/uint128.o \
	bitwise/int8.o bitwise/int128.o \
	bitwise/uint8.o bitwise/uint16.o bitwise/uint32.o bitwise/uint64.o bitwise/uint128.o \
	casts/uint8.o casts/uint16.o casts/uint32.o casts/uint64.o casts/uint128.o \
	casts/int8.o casts/int16.o casts/int32.o casts/int64.o casts/int128.o \
	agg/uint8.o agg/uint16.o agg/uint32.o agg/uint64.o agg/uint128.o agg/int8.o agg/int128.o \
	series/uint8.o series/uint16.o series/uint32.o series/uint64.o series/uint128.o series/int8.o series/int128.o \
	ranges/uint8.o ranges/uint16.o ranges/uint32.o ranges/uint64.o ranges/uint128.o ranges/int8.o ranges/int128.o

# -Werror treat warnings as errors
# -march=native generate instructions for the machine type cpu-type
#PG_CFLAGS=-Werror -march=native

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)

# Generates both C and SQL code
gen:
	php codegen.php

# Generates only C code
gen-c:
	php codegen.php --c-only

# Generates only SQL code
gen-sql:
	php codegen.php --sql-only

